


import UIKit
import PDFKit

class PdfViewVC: UIViewController, URLSessionDelegate {
    var pdfView = PDFView()
    var pdfURL : URL!
    var selected_id = String()

    
    let shareButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
      //  button.setTitleColor(Color2, for: .normal)
        button.setImage(UIImage(named: "sharelogo"), for: .normal)
        button.addTarget(self, action: #selector(shareAction), for: .touchUpInside)

        return button
    }( )
    
//    let logoImage : UIImageView = {
//       let image = UIImageView(image: #imageLiteral(resourceName: "sharelogo"))
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFit
//        return image
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Color2
        self.navigationItem.standardAppearance = appearance;
        self.navigationItem.scrollEdgeAppearance = self.navigationItem.standardAppearance
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = Color2
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareButton)

      
    //    configureItem()
        
        self.view.addSubview(pdfView)
        pdfView.autoScales = true
        self.navigationController?.title = "Report"
             if let document = PDFDocument(url: pdfURL)
            {
                 pdfView.document = document
             }
        
        
    }
    
    
       override func viewDidLayoutSubviews() {
        pdfView.frame = self.view.safeAreaLayoutGuide.layoutFrame
       }
    
//    private func configureItem() {
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareButton)
//    }
    @objc func shareAction() {
//        guard let pdfDocument = PDFDocument(url: pdfURL) else { return }
//        print(pdfDocument)
        guard let url = URL(string: "\(K.mainURL)/api/v1/doctors/report/\(selected_id)")else {return}
               let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
               let downloadTask = urlSession.downloadTask(with: url)
               downloadTask.resume()
        print(url)
        
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }

}

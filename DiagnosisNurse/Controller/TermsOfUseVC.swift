//
//  TermsOfUseVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 19/04/2022.
//

import Foundation
import UIKit
import WebKit

class TermsOfUseVC : UIViewController, WKUIDelegate {
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
            super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
            setupUI()
        guard let url = Bundle.main.url(forResource: "Diagnosis+ EULA and Provider Participation Agreement", withExtension: "html") else { return }
            let myRequest = URLRequest(url: url)
            webView.load(myRequest)
//        let htmlFile = Bundle.main.path(forResource: "Diagnosis+ Patient Participation", ofType: "html")
//        guard let htmlString = try? String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8) else { return }
//        let headerString = "<head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></head>"
//        webView.loadHTMLString(headerString + htmlString, baseURL: nil)
        }

    func setupUI() {
        self.view.backgroundColor = Color1
            self.view.addSubview(webView)
            
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Color2
        self.navigationItem.standardAppearance = appearance;
        self.navigationItem.scrollEdgeAppearance = self.navigationItem.standardAppearance
        self.navigationController?.navigationBar.barTintColor = Color2
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
        view.backgroundColor = Color1
        self.navigationItem.title = "Terms of Use"
        
            NSLayoutConstraint.activate([
                webView.topAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                webView.leftAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
                webView.bottomAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                webView.rightAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
            ])
        }

    }


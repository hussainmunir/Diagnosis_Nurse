//
//  TermsLoginVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 19/04/2022.
//


import Foundation
import UIKit
import WebKit

class TermsLoginPageVC: UIViewController, WKUIDelegate {
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            let myURL = URL(string: "https://diagnosis.plus/wp/terms/")
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
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

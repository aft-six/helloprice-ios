//
//  MainViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/06/03.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import WebKit

import NSObject_Rx

class MainViewController: BaseViewController, ViewModelBindableType {
    
    var viewModel: MainViewModel!
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = WKWebViewConfiguration()
        let contentController = WKUserContentController()
        
        let userScript = WKUserScript(source: "redHeader()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(userScript)
        
        config.userContentController = contentController
    }
    
    func bindViewModel() {
        
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
    }
}


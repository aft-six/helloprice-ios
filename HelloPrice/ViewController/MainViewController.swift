//
//  MainViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/06/03.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, ViewModelBindableType {
    typealias ViewModelType = MainViewModel
    
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func bindViewModel() {
        
    }
}


//let config = WKWebViewConfiguration()
//let contentController = WKUserContentController()
//
//let userScript = WKUserScript(source: "redHeader()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
//contentController.addUserScript(userScript)
//
//config.userContentController = contentController

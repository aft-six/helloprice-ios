//
//  WebViewer.swift
//  HelloPrice
//
//  Created by devming on 2021/01/31.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class WebViewController: BottomSheetViewController {
    let mainView: UIView
    let webViewNavigationView: UIView
    let webView: WKWebView
    let config = WKWebViewConfiguration()
    var initialUrlString = ""
    
    required init?(coder: NSCoder) {
        self.mainView = UIView(frame: .zero)
        self.webViewNavigationView = UIView(frame: .zero)
        self.webView = WKWebView(frame: .zero, configuration: config)
        super.init(coder: coder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.mainView = UIView(frame: .zero)
        self.webViewNavigationView = UIView(frame: .zero)
        self.webView = WKWebView(frame: .zero, configuration: config)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        loadWebView()
        addBottomSheetMainView(mainView)
    }
    
    func initView() {
        webViewNavigationView.backgroundColor = .red
        mainView.addSubview(webViewNavigationView)
        webViewNavigationView.snp.makeConstraints { maker in
            maker.top.leading.trailing.equalToSuperview()
            maker.height.equalTo(44)
        }
        
        mainView.addSubview(webView)
        webView.backgroundColor = .clear
        webView.snp.makeConstraints { maker in
            maker.top.equalTo(webViewNavigationView)
            maker.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func loadWebView() {
        if let url = URL(string: initialUrlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

extension WebViewController {
    convenience init(urlString: String?) {
        self.init()
        initialUrlString = urlString ?? ""
    }
}

//
//  WebViewCoordinating.swift
//  HelloPrice
//
//  Created by devming on 2021/01/31.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit

protocol WebViewCoordinating: class {
    var navigationController: UINavigationController { get }
    func popUpWebView(urlString: String?)
}

extension WebViewCoordinating {
    func popUpWebView(urlString: String?) {
        let viewController = WebViewController(urlString: urlString)
        navigationController.topViewController?.addBottomSheetViewController(viewController: viewController)
    }
}

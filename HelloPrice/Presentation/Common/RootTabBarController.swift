//
//  RootTabBarController.swift
//  HelloPrice
//
//  Created by devming on 2020/08/17.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {
    
    struct AddButtonState {
        var isOpen = false
    }
    
    let subButtonBackView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subButtonBackView.alpha = 0
        subButtonBackView.backgroundColor = .clear
    }
}

extension RootTabBarController {
    func initViewControllers(viewControllers: [UIViewController]) {
        
        viewControllers.forEach {
            let nav = UINavigationController(rootViewController: $0)
            self.addChild(nav)
            
            if $0 is HomeViewController {
//                nav.isNavigationBarHidden = true
//                let titleView = UIView()
//                titleView.backgroundColor = .red
//                titleView.frame = nav.navigationBar.frame
//                nav.navigationItem.titleView = titleView
//                nav.navigationBar.backgroundColor = .clear
                nav.navigationBar.prefersLargeTitles = true
//                nav.navigationBar.largeTitleTextAttributes =
//                    [NSAttributedString.Key.foregroundColor: UIColor.white,
//                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .black)]
            }
//            UIFont(name: "S-CoreDream-9Black", size: 28)
        }
    }
}

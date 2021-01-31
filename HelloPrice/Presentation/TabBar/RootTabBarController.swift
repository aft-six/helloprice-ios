//
//  RootTabBarController.swift
//  HelloPrice
//
//  Created by devming on 2020/08/17.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {
    
//    let tabBarCoordinator = RootTabBarCoordinator()
    
    struct AddButtonState {
        var isOpen = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subButtonBackView = UIView()
        subButtonBackView.alpha = 0
        subButtonBackView.backgroundColor = .clear
        
        tabBar.unselectedItemTintColor = .darkIndigo30
        tabBar.tintColor = .darkIndigoText100
//        tabBar.barStyle = .
    }
}

extension RootTabBarController {
    func initViewControllers(viewControllers: [UIViewController]) {
        viewControllers.enumerated().forEach { (index, viewController) in
            self.addChild(viewController)
            
            if index == 0 {
                viewController.tabBarItem.selectedImage = UIImage(identifier: .tabHomeOn)
                viewController.tabBarItem.image = UIImage(identifier: .tabHomeOff)
                viewController.tabBarItem.title = "홈"
            } else if index == 1 {
                viewController.tabBarItem.selectedImage = UIImage(identifier: .tabMyItemOn)
                viewController.tabBarItem.image = UIImage(identifier: .tabMyItemOff)
                viewController.tabBarItem.title = "내 아이템"
            } else if index == 2 {
                viewController.tabBarItem.selectedImage = UIImage(identifier: .tabNotiOn)
                viewController.tabBarItem.image = UIImage(identifier: .tabNotiOff)
                viewController.tabBarItem.title = "알림"
            } else if index == 3 {
                viewController.tabBarItem.selectedImage = UIImage(identifier: .tabMyOn)
                viewController.tabBarItem.image = UIImage(identifier: .tabMyOff)
                viewController.tabBarItem.title = "마이"
            }
            
        }
    }
}

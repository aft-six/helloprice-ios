//
//  AppCoordinator.swift
//  HelloPrice
//
//  Created by devming on 2020/08/16.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    let tabBarController: RootTabBarController?
    let homeCoordinator: HomeCoordinator
    let myProductCoordninator: MyProductCoordinator
    
    init(window: UIWindow) {
        self.window = window
        
        homeCoordinator = HomeCoordinator()
        myProductCoordninator = MyProductCoordinator()
        
        let storyboard = UIStoryboard(name: StoryboardName.tabBar.name, bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: RootTabBarController.className) as? RootTabBarController
        self.tabBarController = tabBarController
        
        self.window.rootViewController = tabBarController
    }
    
    func start() {
        let viewControllers = [homeCoordinator.navigationController,
                               myProductCoordninator.navigationController,
                               UINavigationController(),
                               UINavigationController()]
        tabBarController?.initViewControllers(viewControllers: viewControllers)
        
        homeCoordinator.start()
    }
    
}

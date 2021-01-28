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
//    private let tabBarCoordinator: RootTabBarCoordinator
    let homeCoordinator: HomeCoordinator
    let tabBarController: RootTabBarController?
    
    init(window: UIWindow) {
        self.window = window
//        self.tabBarCoordinator = RootTabBarCoordinator()
        
        let apiService = HomeAPIService()
        self.homeCoordinator = HomeCoordinator(apiService: apiService)
        
        let storyboard = UIStoryboard(name: "RootTabBarController", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: RootTabBarController.className) as? RootTabBarController
        self.tabBarController = tabBarController
        
        self.window.rootViewController = tabBarController
    }
    
    func start() {
        let viewControllers = [homeCoordinator.navigationController]
        tabBarController?.initViewControllers(viewControllers: viewControllers)
        
        homeCoordinator.start()
    }
    
}

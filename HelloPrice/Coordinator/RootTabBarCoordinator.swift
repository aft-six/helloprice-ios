//
//  MainTabBarCoordinator.swift
//  HelloPrice
//
//  Created by devming on 2021/01/27.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit

class RootTabBarCoordinator {
    let homeCoordinator: HomeCoordinator
    let tabBarController: RootTabBarController?
    
    init() {
        let apiService = HomeAPIService()
        self.homeCoordinator = HomeCoordinator(apiService: apiService)
        
        let storyboard = UIStoryboard(name: "RootTabBarController", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: RootTabBarController.className) as? RootTabBarController
        self.tabBarController = tabBarController
    }
    
    func start() {
        let viewControllers = [homeCoordinator.navigationController]
        tabBarController?.initViewControllers(viewControllers: viewControllers)
        
        homeCoordinator.start()
    }
}

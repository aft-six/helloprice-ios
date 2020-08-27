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
    private let appDIContainer: AppDIContainer
    
    init(window: UIWindow, appDIContainer: AppDIContainer) {
        self.window = window
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let productDIContainer = appDIContainer.productDIContainer
        
        let productViewModel = productDIContainer.makeMyProductViewModel()
        let myProductViewController = Scene.myProductList(productViewModel).instantiate()
        
        let myPageViewModel = productDIContainer.makeMyPageViewModel()
        let myPageViewController = Scene.myPage(myPageViewModel).instantiate()
        
        let coordinator = SceneCoordinator(window: window)
        coordinator.transition(to: .main([myProductViewController,
                                          myPageViewController]),
                               using: .root,
                               animated: false)
    }
}

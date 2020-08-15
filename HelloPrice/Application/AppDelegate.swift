//
//  AppDelegate.swift
//  HelloPrice
//
//  Created by devming on 2020/05/30.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        let coordinator = SceneCoordinator(window: window!)
        let useCase = ShowMyProductListUseCaseImpl()
        let myProductViewModel = MyProductViewModel(useCase: useCase)
        
        coordinator.transition(to: .main(myProductViewModel), using: .root, animated: false)
        
        return true
    }
}


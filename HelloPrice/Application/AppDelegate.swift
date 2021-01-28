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
    var appCoordinator: AppCoordinator?
//    private var tabBarCoordinator: RootTabBarCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        tabBarCoordinator = RootTabBarCoordinator()
//        window?.rootViewController = tabBarCoordinator?.tabBarController
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()
        window?.makeKeyAndVisible()
        
        return true
    }
}


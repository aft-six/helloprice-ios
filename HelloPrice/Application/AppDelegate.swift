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
    let appDIContainer = AppDIContainer()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        
        appCoordinator = AppCoordinator(window: window!, appDIContainer: appDIContainer)
        appCoordinator?.start()
        
        return true
    }
}


//
//  Coordinator.swift
//  HelloPrice
//
//  Created by devming on 2021/01/27.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}

enum StoryboardName {
    case tabBar
    case home
    case myProduct
    case myPage
    case notification
    
    var name: String {
        switch self {
        case .tabBar:
            return "RootTabBarController"
        case .home:
            return "Home"
        case .myProduct:
            return "MyProductList"
        case .myPage:
            return "MyPage"
        case .notification:
            return "Notification"
        }
    }
}

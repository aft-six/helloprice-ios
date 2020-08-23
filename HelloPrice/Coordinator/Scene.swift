//
//  Scene.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

enum Scene {
    case main(MyProductViewModel)
    case myPage(MyPageViewModel)
    case login
    case signUp
}

extension Scene {
    func instantiate(from storyboardName: String = StoryboardName.RootTabBarController.rawValue) -> UIViewController {
        let storyboard: UIStoryboard
        
        switch self {
        case .main(let viewModel):
            storyboard = UIStoryboard(name: storyboardName, bundle: nil)
//            var viewController = storyboard.instantiateViewController(withIdentifier: MyProductListViewController.className) as! MyProductListViewController
//            viewController.bindViewModel(viewModel: viewModel)
            var viewController = storyboard.instantiateViewController(withIdentifier: RootTabBarController.className) as! RootTabBarController
            return viewController
        case .myPage(_):
            storyboard = UIStoryboard(name: storyboardName, bundle: nil)
            break
        case .login:
            storyboard = UIStoryboard(name: StoryboardName.Main.rawValue, bundle: nil)
            break
        case .signUp:
            storyboard = UIStoryboard(name: StoryboardName.Main.rawValue, bundle: nil)
            break
        }
        
        return UIViewController ()
    }
}

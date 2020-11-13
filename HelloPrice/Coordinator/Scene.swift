//
//  Scene.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

enum Scene {
    case main([UIViewController])
    case home(HomeViewModel)
    case myProductList(MyProductViewModel)
    case myPage(MyPageViewModel)
    case signIn(SignInViewModel)
    case signUp(SignUpViewModel)
}

extension Scene {
    
    var storyboardName: String {
        switch self {
        case .main:
            return StoryboardName.RootTabBarController.rawValue
        case .home(_):
            return StoryboardName.ShowHome.rawValue
        case .myProductList(_):
            return StoryboardName.ShowMyProductList.rawValue
        case .myPage(_):
            return StoryboardName.ShowMyPage.rawValue
        case .signIn(_):
            return StoryboardName.SignIn.rawValue
        case .signUp(_):
            return StoryboardName.SignUp.rawValue
        }
    }
    
    func instantiate() -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        switch self {
        case .main(let viewControllers):
            let tabBarController = storyboard.instantiateViewController(withIdentifier: RootTabBarController.className) as! RootTabBarController
            tabBarController.initViewControllers(viewControllers: viewControllers)
            return tabBarController
        case .home(let viewModel):
            var viewController = storyboard.instantiateViewController(withIdentifier: HomeViewController.className) as! HomeViewController
            viewController.bindViewModel(viewModel: viewModel)
            return viewController
        case .myProductList(let viewModel):
            var viewController = storyboard.instantiateViewController(withIdentifier: MyProductListViewController.className) as! MyProductListViewController
            viewController.bindViewModel(viewModel: viewModel)
            return viewController
        case .myPage(let viewModel):
            var viewController = storyboard.instantiateViewController(withIdentifier: MyPageViewController.className) as! MyPageViewController
            viewController.bindViewModel(viewModel: viewModel)
            return viewController
        case .signIn(let viewModel):
            var viewController = storyboard.instantiateViewController(withIdentifier: SignInViewController.className) as! SignInViewController
            viewController.bindViewModel(viewModel: viewModel)
            return viewController
        case .signUp(let viewModel):
            var viewController = storyboard.instantiateViewController(withIdentifier: SignUpViewController.className) as! SignUpViewController
            viewController.bindViewModel(viewModel: viewModel)
            return viewController
        }
        
    }
}

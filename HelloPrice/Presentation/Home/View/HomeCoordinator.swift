//
//  HomeCoordinator.swift
//  HelloPrice
//
//  Created by devming on 2021/01/27.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    let apiService: HomeAPIService
    let navigationController: UINavigationController
    
    init() {
        self.apiService = HomeAPIService()
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let storyboard = UIStoryboard(name: StoryboardName.home.name, bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: HomeViewController.className) as? HomeViewController {
            
//            let repository = HomeRepositoryImpl(apiService: apiService)
            let repository = HomeRepositoryMock(apiService: apiService)
            let reactor = HomeReactor(repository: repository)
            viewController.coordinatorDelegate = self
            viewController.reactor = reactor
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}

extension HomeCoordinator: HomeCoordinating {
    func pushToSearchViewController() {
        let storyboard = UIStoryboard(name: StoryboardName.home.name, bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: SearchViewController.className)
        viewController.modalPresentationStyle = .fullScreen
        viewController.hero.isEnabled = true
        navigationController.topViewController?.present(viewController, animated: true)
    }
}

protocol HomeCoordinating: WebViewCoordinating {
    func pushToSearchViewController()
}

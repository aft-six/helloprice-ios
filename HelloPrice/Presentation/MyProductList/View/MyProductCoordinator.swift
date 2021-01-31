//
//  MyProductCoordinator.swift
//  HelloPrice
//
//  Created by devming on 2021/01/31.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit

class MyProductCoordinator: Coordinator {
    let apiService: ProductAPIService
    let navigationController: UINavigationController
    
    init() {
        apiService = ProductAPIService()
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let storyboard = UIStoryboard(name: StoryboardName.myProduct.name, bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: MyProductListViewController.className) as? MyProductListViewController {
            let repository = ProductRepositoryImpl(apiService: apiService)
            let reactor = MyProductReactor(repository: repository)
            viewController.coordinatorDelegate = self
            viewController.reactor = reactor
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}

extension MyProductCoordinator: MyProductCoordinating {
    // Implement navigating something.
}

protocol MyProductCoordinating: WebViewCoordinating { }

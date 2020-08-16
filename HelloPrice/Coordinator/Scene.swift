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
}

extension Scene {
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .main(let viewModel):
            var viewController = storyboard.instantiateViewController(withIdentifier: MyProductListViewController.className) as! MyProductListViewController
            viewController.bindViewModel(viewModel: viewModel)
            return viewController
        case .myPage(_):
            break
        }
        
        return UIViewController ()
    }
}

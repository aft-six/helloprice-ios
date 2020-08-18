//
//  MainTabBarViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/08/17.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    
    init(tabs: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        
        setViewControllers(tabs, animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}

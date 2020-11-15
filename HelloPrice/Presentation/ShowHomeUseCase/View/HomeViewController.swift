//
//  HomeViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    @IBOutlet weak var titleBackHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController()
        print("이건데?")
    }
    
    func setNavigationController() {
        let defaultHeight: CGFloat = 131
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .richBlue
        titleBackHeightConstraint.constant = defaultHeight + topSafeAreaHeight
    }
}

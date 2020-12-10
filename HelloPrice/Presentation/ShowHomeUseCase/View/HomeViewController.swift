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
    @IBOutlet weak var titleViewHeightConstraint: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setNavigationController()
        print("이건데?")
//        let titleView = UIView()
//        titleView.backgroundColor = .red
//        titleView.frame = navigationController?.navigationBar.frame ?? CGRect.zero
//        self.navigationItem.titleView = titleView
    }
    
    func setNavigationController() {
        let defaultHeight: CGFloat = 131
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .richBlue
        titleBackHeightConstraint.constant = defaultHeight + topSafeAreaHeight
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        navigationController?.isNavigationBarHidden =   scrollView.contentOffset.y <= 0
//        print("\(scrollView.contentOffset.y)")
    }
}

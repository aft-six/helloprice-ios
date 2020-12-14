//
//  SearchViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/12/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchViewController: BaseViewController<SearchViewModel> {
    
    @IBOutlet weak var searchFieldTopConstraint: NSLayoutConstraint! {
        didSet {
            searchFieldTopConstraint.constant += topSafeAreaHeight
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

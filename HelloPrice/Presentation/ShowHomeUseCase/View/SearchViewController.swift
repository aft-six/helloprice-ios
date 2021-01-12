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
import Hero

class SearchViewController: BaseViewController<SearchViewModel> {
    
    @IBOutlet weak var searchFieldTopConstraint: NSLayoutConstraint! {
        didSet {
            searchFieldTopConstraint.constant += topSafeAreaHeight
        }
    }
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        bindRx()
    }
    
    func setUI() {
        searchField.becomeFirstResponder()
    }
    
    func bindRx() {
        cancelButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                self?.hero.dismissViewController()
            })
            .disposed(by: 👜)
    }
}

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

class SearchViewController: BaseViewController<SearchReactor> {
    
    @IBOutlet weak var searchFieldTopConstraint: NSLayoutConstraint! {
        didSet {
            searchFieldTopConstraint.constant += topSafeAreaHeight
        }
    }
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var deleteAll: UIButton!
    
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
            .disposed(by: disposeBag)
        
        let dummy: [String] = [
            "a",
            "bn",
            "sdaf",
            "1234",
            "sdafg",
            "23rf",
            "asdv",
            "adsv",
            "asda",
            "dsa",
            "bvca",
            "ytjura"
        ]
        deleteAll.rx.tap
            .throttle(.milliseconds(2000), scheduler: MainScheduler.instance)
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
//                self?.addBottomSheetView(viewController: SearchFilterBottomSheet(list: dummy))
                self?.addBottomSheetView(viewController: SearchBottomSheet())
            })
            .disposed(by: disposeBag)
        
    }
    
}

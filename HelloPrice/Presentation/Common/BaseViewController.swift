//
//  BaseViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController<T: ViewModelType>: UIViewController, ViewModelBindableControllerType {
    
    var 👜 = DisposeBag()
    var viewModel: T!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bindViewModel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        👜 = DisposeBag()
        if var viewModel = viewModel {
            viewModel.👜 = DisposeBag()
        }
    }
    
    func bindViewModel() {
//        fatalError("You must override here!")
    }
}

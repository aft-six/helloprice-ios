//
//  ViewModelBindableControllerType.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

protocol ViewModelBindableControllerType {
    associatedtype ViewModel
    var viewModel: ViewModel! { get set }
    func bindViewModel()
}

extension ViewModelBindableControllerType where Self: UIViewController {
    mutating func bindViewModel(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        loadViewIfNeeded()
        
//        bindViewModel()
    }
}

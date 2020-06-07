//
//  ViewModelBindableType.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

protocol ViewModelBindableType {
    associatedtype ViewModelType
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController {
    mutating func bindViewModel(viewModel: ViewModelType) {
        self.viewModel = viewModel
        
        loadViewIfNeeded()
        
        bindViewModel()
    }
}

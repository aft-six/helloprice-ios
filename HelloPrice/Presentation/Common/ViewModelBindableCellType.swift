//
//  ViewModelBindableCellType.swift
//  HelloPrice
//
//  Created by devming on 2020/08/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

protocol ViewModelBindableCellType {
    associatedtype ViewModelType
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension ViewModelBindableCellType where Self: UIViewController {
    mutating func bindViewModel(vieWModel: ViewModelType) {
        self.viewModel = viewModel
        
        loadViewIfNeeded()
        
        bindViewModel()
    }
}

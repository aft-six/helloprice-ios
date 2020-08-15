//
//  BaseCollectionViewCell.swift
//  HelloPrice
//
//  Created by devming on 2020/08/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

class BaseCollectionViewCell<T: ViewModelType>: UICollectionViewCell, ViewModelBindableCellType {
    var viewModel: T!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        bindViewModel()
    }
    
    func bindViewModel() { }
}

//
//  BaseTableViewCell.swift
//  HelloPrice
//
//  Created by devming on 2020/08/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

class BaseTableViewCell<T: ViewModelType>: UITableViewCell, ViewModelBindableCellType {
    var viewModel: T!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        bindViewModel()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bindViewModel()
    }
    
    func bindViewModel() { }
}

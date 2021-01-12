//
//  BaseTableViewCell.swift
//  HelloPrice
//
//  Created by devming on 2020/08/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift

class BaseTableViewCell<T: ViewModelType, OutputType: ViewModelOutput, DomainType: DomainObject>: UITableViewCell, CellItemType {
    var indexPath: IndexPath!
    
    var 👜 = DisposeBag()
    var viewModel: T!
    var item: DomainType?
    var output: OutputType?
    override var reuseIdentifier: String? {
        return Self.className
    }
    
    func bindViewModel() {
        
    }
}

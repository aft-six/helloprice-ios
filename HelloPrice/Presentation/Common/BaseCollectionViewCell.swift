//
//  BaseCollectionViewCell.swift
//  HelloPrice
//
//  Created by devming on 2020/08/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift

class BaseCollectionViewCell<T: ViewModelType,
                             OutputType: ViewModelOutput,
                             DomainType: DomainObject>: UICollectionViewCell, CellItemType {
    
    var 👜 = DisposeBag()
    var viewModel: T!
    var item: DomainType?
    var output: OutputType?
    class var identifier: String {
        return Self.className
    }
    
    func bindViewModel(item: DomainType) {
        
    }
}

//class BaseCollectionViewCell<T: ViewModelType>: UICollectionViewCell, ViewModelBindableCellType {
//    var viewModel: T!
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//
//        bindViewModel()
//    }
//
//    func bindViewModel() { }
//}

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
//    var item: DomainType?
    var indexPath: IndexPath!
    var output: OutputType?
    class var identifier: String {
        return Self.className
    }
    
    func bindViewModel() {
        #if DEBUG
        fatalError("You must override here!")
        #endif
    }
//    func bindViewModel(item: DomainType) {
//
//    }
}

protocol CellItemType {}
//    associatedtype CellViewModel
//    var viewModel: CellViewModel! { get set }
//    var indexPath: IndexPath! { get set }
//    func bindViewModel()
//    associatedtype OutputType
//    var output: OutputType? { get set }
//}
//
//extension CellItemType where Self: UICollectionViewCell {
//    mutating func bindViewModel(viewModel: CellViewModel, indexPath: IndexPath) {
//        self.viewModel = viewModel
//        self.indexPath = indexPath
//
//        bindViewModel()
//    }
//}
//
//
//extension CellItemType where Self: UITableViewCell {
//    mutating func bindViewModel(viewModel: CellViewModel, indexPath: IndexPath) {
//        self.viewModel = viewModel
//        self.indexPath = indexPath
//
//        bindViewModel()
//    }
//}

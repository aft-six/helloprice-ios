//
//  BaseTableViewCell.swift
//  HelloPrice
//
//  Created by devming on 2020/08/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift

class BaseTableViewCell<T: ViewModelType, OutputType: ViewModelOutput, ItemType: Item>: UITableViewCell, CellItemType {
    
    var 👜 = DisposeBag()
    var viewModel: T!
    var item: ItemType?
    var output: OutputType?
    var viewModelCreatable: CellViewModelCreatable?
    
    func bindViewModel(item: ItemType) {
        viewModelCreatable?.createCellViewModel()
    }
}

protocol CellItemType {
    associatedtype ItemType
    associatedtype OutputType
    var item: ItemType? { get set }
    var output: OutputType? { get set }
    var viewModelCreatable: CellViewModelCreatable? { get set }
    func bindViewModel(item: ItemType)
}

protocol CellViewModelCreatable {
    func createCellViewModel()
}

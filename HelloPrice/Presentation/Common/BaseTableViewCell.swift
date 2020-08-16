//
//  BaseTableViewCell.swift
//  HelloPrice
//
//  Created by devming on 2020/08/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift

class BaseTableViewCell<T: ViewModelType, ItemType: Item>: UITableViewCell, CellItemType {
    
    var 👜 = DisposeBag()
    var viewModel: T!
    var item: ItemType?
    
    func bindViewModel(item: ItemType) {
        self.item = item
    }
}

protocol CellItemType {
    associatedtype ItemType
    var item: ItemType? { get set }
    func bindViewModel(item: ItemType)
}
extension CellItemType where Self: UITableViewCell {
    mutating func bindViewModel(item: ItemType) {
        self.item = item
    }
}

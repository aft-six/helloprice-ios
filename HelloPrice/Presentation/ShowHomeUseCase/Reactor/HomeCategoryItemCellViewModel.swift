//
//  HomeCategoryItemCellViewModel.swift
//  HelloPrice
//
//  Created by devming on 2020/12/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeCategoryItemCellViewModel: ViewModelType {
    
    var 👜 = DisposeBag()
    
    struct Input: ViewModelInput {
        let bindData = PublishRelay<Product>()
    }
    
    struct Output: ViewModelOutput {
        let thumbnailImageUrlString = BehaviorRelay<String>(value: "")
        let productName = BehaviorRelay<String>(value: "")
        let paymentMethod = BehaviorRelay<String>(value: "")
        let currentPrice = BehaviorRelay<String>(value: "0")
//        let previousPrice = BehaviorRelay<String>(value: 0)
        let changeRate = BehaviorRelay<Double>(value: 0.0)
//        let lowestPrice = BehaviorRelay<String>(value: 0)
        let lastConfirmTime = BehaviorRelay<String>(value: "")
    }
}

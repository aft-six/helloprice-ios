//
//  MyProductCellViewModel.swift
//  HelloPrice
//
//  Created by devming on 2020/08/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift
import RxCocoa

class MyProductCellViewModel: BaseCellViewModel {
    
    struct Input: ViewModelInput {
        let bindData = PublishRelay<Product>()
    }
    
    struct Output: ViewModelOutput {
        let thumbnailImageUrlString = BehaviorRelay<String>(value: "")
        let productName = BehaviorRelay<String>(value: "")
        let paymentMethod = BehaviorRelay<String>(value: "")
        let currentPrice = BehaviorRelay<Int>(value: 0)
        let previousPrice = BehaviorRelay<Int>(value: 0)
        let lowestPrice = BehaviorRelay<Int>(value: 0)
        let lastConfirmTime = BehaviorRelay<String>(value: "")
    }
    
    func transform(input: Input) -> Output {
        let product = input.bindData
        let outputs = Output()
        
        product.map { $0.imageUrl }
            .bind(to: outputs.thumbnailImageUrlString)
            .disposed(by: 👜)
            
        product.map { $0.productName }
            .bind(to: outputs.productName)
            .disposed(by: 👜)
        
        product.map { $0.saleType }
            .bind(to: outputs.paymentMethod)
            .disposed(by: 👜)
        
        product.map { $0.price }
            .bind(to: outputs.currentPrice)
            .disposed(by: 👜)
        
        product.map { $0.prevPrice }
            .bind(to: outputs.previousPrice)
            .disposed(by: 👜)
        
        product.map { $0.priceChangeRate }
            .bind(to: outputs.lowestPrice)
            .disposed(by: 👜)
        
        product.map { $0.lastUpdateAt }
            .bind(to: outputs.lastConfirmTime)
            .disposed(by: 👜)
        
        return outputs
    }
    
}

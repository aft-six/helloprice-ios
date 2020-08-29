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
        let changeRate = BehaviorRelay<Double>(value: 0.0)
        let lowestPrice = BehaviorRelay<Int>(value: 0)
        let lastConfirmTime = BehaviorRelay<String>(value: "")
    }
    
    func transform(input: Input) -> Output {
        let product = input.bindData
        let outputs = Output()
        
        product.map { $0.imageUrl }
        .do (onNext: {
            print("imageUrl \($0)")
        })
            .bind(to: outputs.thumbnailImageUrlString)
            .disposed(by: 👜)
            
        product.map { $0.productName }
        .do (onNext: {
            print("productName \($0)")
        })
            .bind(to: outputs.productName)
            .disposed(by: 👜)
        
        product.map { $0.saleType }
        .do (onNext: {
            print("saleType \($0)")
        })
            .bind(to: outputs.paymentMethod)
            .disposed(by: 👜)
        
        product.map { $0.price }
        .do (onNext: {
            print("paymentMethod \($0)")
        })
            .bind(to: outputs.currentPrice)
            .disposed(by: 👜)
        
        product.map { $0.prevPrice }
        .do (onNext: {
            print("currentPrice \($0)")
        })
            .bind(to: outputs.previousPrice)
            .disposed(by: 👜)
        
        product.map { $0.lowestPrice! }
            .do (onNext: {
                print("lowestPrice \($0)")
            })
            .bind(to: outputs.lowestPrice)
            .disposed(by: 👜)
        
        product.map { $0.priceChangeRate! }
        .do (onNext: {
            print("priceChangeRate \($0)")
        })
            .bind(to: outputs.changeRate)
            .disposed(by: 👜)
        
        product.map { $0.lastUpdateAt }
        .do (onNext: {
            print("lastUpdateAt \($0)")
        })
            .bind(to: outputs.lastConfirmTime)
            .disposed(by: 👜)
        
        return outputs
    }
    
}

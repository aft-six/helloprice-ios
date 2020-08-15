//
//  MyProductViewModel.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift
import RxCocoa

class MyProductViewModel: BaseViewModel {
    struct Input {
        let fetchDatas: PublishRelay<Void>
        let presentWebsite: PublishRelay<Void>
        
//        init(fetchDatas: Driver<Void>, presentWebsite: Driver<Void>) {
//            self.fetchDatas = fetchDatas
//            self.presentWebsite = presentWebsite
//        }
    }
    
    struct Output {
        let products = PublishRelay<[Product]>()
        let productsCount = PublishRelay<Int>()
    }
    
    var useCase: ShowMyProductListUseCase
    
    init(useCase: ShowMyProductListUseCase) {
        self.useCase = useCase
        
        super.init()
    }
    
    func transform(inputs: Input) -> Output {
        
        let output = Output()
        
        let products = inputs.fetchDatas
            .flatMap { self.useCase.excute() }
            .share()
            
        products
            .bind(to: output.products)
            .disposed(by: 👜)
        products
            .map { $0.count }
            .bind(to: output.productsCount)
            .disposed(by: 👜)
        
        return output        
    }
}
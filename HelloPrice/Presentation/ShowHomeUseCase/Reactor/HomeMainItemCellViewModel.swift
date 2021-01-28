//
//  HomeMainItemCellViewModel.swift
//  HelloPrice
//
//  Created by devming on 2020/12/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeMainItemCellViewModel: BaseCellViewModel {
    
    struct Input: ViewModelInput {
        let loadData: Driver<Void>
        let tapNotiButton: Driver<Void>
        let tapItem: Driver<Void>
    }
    
    struct Output: ViewModelOutput {
        let bindData = PublishRelay<Product>()
    }
    
    let item: Product
    
    init(item: Product) {
        self.item = item
        
        super.init()
    }
    
    func transform(inputs: Input) -> Output {
        let output = Output()
        
        return output
    }
}

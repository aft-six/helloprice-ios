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
        let bindData = PublishRelay<Product>()
        let tapNotiButton = PublishRelay<Void>()
    }
    
    struct Output: ViewModelOutput {
        let thumbnailImageUrlString = BehaviorRelay<String>(value: "")
        
    }
    
    let useCase: HomeUseCase
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
        
        super.init()
    }
    
    func transform(inputs: Input) -> Output {
        let output = Output()
        
        return output
    }
}

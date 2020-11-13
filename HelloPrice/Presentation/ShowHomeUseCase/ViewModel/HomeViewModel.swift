//
//  HomeViewModel.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift
import RxCocoa

class HomeViewModel: BaseViewModel {
    struct Input: ViewModelInput {
        let fetchCategories: PublishRelay<Void>
        let fetchCategoryItems: PublishRelay<Void>
        let presentWebsite: PublishRelay<Void>
    }
    
    struct Output: ViewModelOutput {
        let products = PublishRelay<[Product]>()
        let productsCount = PublishRelay<Int>()
    }
    
    var useCase: HomeUseCase
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
        
        super.init()
    }
}

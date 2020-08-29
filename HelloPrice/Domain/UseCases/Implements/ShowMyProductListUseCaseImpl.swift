//
//  ShowMyProductListUseCaseImpl.swift
//  HelloPrice
//
//  Created by devming on 2020/08/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

class ShowMyProductListUseCaseImpl: ShowMyProductListUseCase {
    
    let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func fetchMyProducts() -> Single<FetchMyProductResponse> {
        
        return repository.fetchMyProducts()
    }
    
    
}

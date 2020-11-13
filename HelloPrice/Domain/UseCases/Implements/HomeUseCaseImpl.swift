//
//  HomeUseCaseImpl.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

class HomeUseCaseImpl: HomeUseCase {
    
    let repository: HomeRepository
    
    init(repository: HomeRepository) {
        self.repository = repository
    }
    
    func fetchCategories() -> Single<FetchHomeCategoryResponse> {
        return repository.fetchCategories()
    }
    
    func fetchCategoryItems(categoryId: Int) -> Single<FetchMyProductResponse> {
        return repository.fetchCategoryItems(categoryId: categoryId)
    }
    
}

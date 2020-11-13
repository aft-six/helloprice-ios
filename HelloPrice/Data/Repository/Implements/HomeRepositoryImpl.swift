//
//  HomeRepository.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

final class HomeRepositoryImpl: HomeRepository {
    
    
    let apiService: HomeAPIService
    
    init(apiService: APIType) {
        self.apiService = apiService as! HomeAPIService
    }
    
    func fetchCategories() -> Single<FetchHomeCategoryResponse> {
        return apiService.fetchHomeCategories()
    }
    
    func fetchCategoryItems(categoryId: Int) -> Single<FetchMyProductResponse> {
        return apiService.fetchHomeCategoryItems(categoryId: categoryId)
    }
}

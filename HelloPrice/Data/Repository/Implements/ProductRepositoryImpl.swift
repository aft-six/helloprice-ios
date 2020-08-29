//
//  ProductRepositoryImpl.swift
//  HelloPrice
//
//  Created by devming on 2020/08/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

final class ProductRepositoryImpl: ProductRepository {
    
    let apiService: ProductAPIService
    
    init(apiService: APIType) {
        self.apiService = apiService as! ProductAPIService
    }
    
    func fetchMyProducts() -> Single<FetchMyProductResponse> {
        
        return apiService.fetchMyProducts()
    }
    
}

//
//  ProductDIContainer.swift
//  HelloPrice
//
//  Created by devming on 2020/08/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

final class ProductDIContainer: DIContainerType {
    let apiService: APIType

    init(apiService: APIType) {
        self.apiService = apiService
    }
}

/// MyProductList 부분
extension ProductDIContainer {
    
    func makeMyProductViewModel() -> MyProductViewModel {
        return MyProductViewModel(useCase: makeShowMyProductListUseCaseImpl())
    }
    
    func makeShowMyProductListUseCaseImpl() -> ShowMyProductListUseCaseImpl {
        return ShowMyProductListUseCaseImpl(repository: makeProductRepository())
    }
    
    func makeProductRepository() -> ProductRepository {
        return ProductRepositoryImpl(apiService: apiService)
    }
}

/// MyPage 부분
extension ProductDIContainer {
    
    func makeMyPageViewModel() -> MyPageViewModel {
        return MyPageViewModel()
    }
    
    func makeShowMyPageUseCase() -> ShowMyPageUseCaseImpl {
        return ShowMyPageUseCaseImpl(repository: makeMyPageRepository())
    }
    
    func makeMyPageRepository() -> MyPageRepository {
        return MyPageRepositoryImpl()
    }
}

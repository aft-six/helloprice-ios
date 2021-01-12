//
//  HomeDIContainer.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

final class HomeDIContainer: DIContainerType {
    
    var apiService: APIType
    
    init(apiService: APIType) {
        self.apiService = apiService
    }
}

extension HomeDIContainer {
    
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(useCase: makeShowHomeUseCaseImpl())
    }
    
    func makeShowHomeUseCaseImpl() -> HomeUseCase {
        return HomeUseCaseMock()
//        return HomeUseCaseImpl(repository: makeHomeRepository())
    }
    
    func makeHomeRepository() -> HomeRepository {
        return HomeRepositoryImpl(apiService: apiService)
    }
}

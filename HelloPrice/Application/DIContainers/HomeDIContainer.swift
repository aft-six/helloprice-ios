//
//  HomeDIContainer.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

final class HomeDIContainer {
    
    let localDBService: LocalRepository
    let apiService: APIType
    
    init(localDBService: LocalRepository, apiService: APIType) {
        self.localDBService = localDBService
        self.apiService = apiService
    }
}

extension HomeDIContainer {
    
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(useCase: makeShowHomeUseCaseImpl())
    }
    
    func makeShowHomeUseCaseImpl() -> HomeUseCaseImpl {
        return HomeUseCaseImpl(repository: makeHomeRepository())
    }
    
    func makeHomeRepository() -> HomeRepository {
        return HomeRepositoryImpl(apiService: apiService)
    }
}

//
//  SearchProductRepositoryImpl.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

class SearchProductRepositoryImpl: SearchProductRepository {
    let apiService: HomeAPIService
    let localService: SearchLocalService
    
    init(apiService: APIType, localService: BaseLocalDBService) {
        self.apiService = apiService as! HomeAPIService
        self.localService = localService as! SearchLocalService
    }
    
    func createRecentSearch(item: SearchRecentObject) -> Single<Bool> {
//        localService.
        return Single.just(true)
    }
    
    func readRecentSearches() -> Single<[SearchRecentObject]> {
        return Single.just([SearchRecentObject]())
//        return localService.fetch().map
        
            
//            .map { $0.compactMap { $0 as? SearchRecentObject } }
    }
    
    func updateRecentSearch(item: SearchRecentObject, updatedDate: String) -> Single<[SearchRecentObject]> {
        return Single.just([SearchRecentObject]())
    }
    
    func deleteRecentSearch(item: SearchRecentObject) -> Single<Bool> {
        return Single.just(true)
    }
}

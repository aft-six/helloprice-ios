//
//  SearchProductUseCaseImpl.swift
//  HelloPrice
//
//  Created by devming on 2020/08/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

class SearchProductUseCaseImpl: SearchProductUseCase {
    
    let repository: SearchProductRepository
    
    init(repository: SearchProductRepository) {
        self.repository = repository
    }
    
    func createRecentSearch(item: SearchRecentObject) -> Single<Bool> {
        return Single.just(true)
    }
    
    func readRecentSearches() -> Single<[SearchRecentObject]> {
        
        return Single.just([SearchRecentObject]())
    }
    
    func updateRecentSearch(item: SearchRecentObject, updatedDate:  String) -> Single<[SearchRecentObject]> {
        
        return Single.just([SearchRecentObject]())
    }
    
    func deleteRecentSearch(item: SearchRecentObject) -> Single<Bool> {
        return Single.just(true)
    }
}

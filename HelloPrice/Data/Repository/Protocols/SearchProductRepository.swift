//
//  SearchProductRepository.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

protocol SearchProductRepository: RepositoryType {
    func createRecentSearch(item: SearchRecentObject) -> Single<Bool>
    func readRecentSearches() -> Single<[SearchRecentObject]>
    func updateRecentSearch(item: SearchRecentObject, updatedDate: String) -> Single<[SearchRecentObject]>
    func deleteRecentSearch(item: SearchRecentObject) -> Single<Bool>
}

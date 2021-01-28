//
//  HomeRepository.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

protocol HomeRepository: RepositoryType {
    
    func fetchCategories() -> Single<[HomeCategory]>
    func fetchCategoryItems(categoryId: Int) -> Single<[Product]>
}

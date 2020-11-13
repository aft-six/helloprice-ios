//
//  HomeUseCase.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

protocol HomeUseCase: UseCase {
    func fetchCategories() -> Single<FetchHomeCategoryResponse>
    func fetchCategoryItems() -> Single<FetchHomeCategoryResponse>
}

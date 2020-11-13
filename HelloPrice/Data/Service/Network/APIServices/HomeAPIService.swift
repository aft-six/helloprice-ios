//
//  HomeAPIService.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift
import Alamofire

class HomeAPIService: APIType {
    
    let httpHeader: HTTPHeader
    
    init(authToken token: String = "Bearer tokenblabla") {
        self.httpHeader = HTTPHeader.authorization(bearerToken: token)
    }
    
    func fetchHomeCategories() -> Single<FetchHomeCategoryResponse> {

        let api = HomeCategoryFetchingAPI()
        return api.request()
    }
    
    func fetchHomeCategoryItems(categoryId: Int) -> Single<FetchMyProductResponse> {
        
        let data = FetchMyProductByCategoryRequest(categoryId: categoryId)
        let api = MyProductFetchingAPI(bodyData: data, headersParam: HTTPHeaders([httpHeader]))
        return api.request()
    }
}

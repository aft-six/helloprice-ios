//
//  ProductAPIService.swift
//  HelloPrice
//
//  Created by devming on 2020/08/28.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift
import Alamofire

class ProductAPIService: APIType {
    
    let httpHeader: HTTPHeader
    
    init(authToken token: String = "Bearer tokenblabla") {
        self.httpHeader = HTTPHeader.authorization(bearerToken: token)
    }
    
    func registerProduct(productCode: String) -> Single<RegistProductResponse> {
    
        let data = RegistProductRequestBody(productCode: productCode)
        let api = ProductRegistrationAPI(bodyData: data, headersParam: HTTPHeaders([httpHeader]))
        return api.request()
    }
    
    func fetchTopDecreaseProducts() -> Single<FetchTopDecreaseProductResponse> {

        let api = TopDecreasedProductFetchingAPI(headersParam: HTTPHeaders([httpHeader]))
        return api.request()
    }
    
    func fetchMyProducts() -> Single<FetchMyProductResponse> {

        let api = MyProductFetchingAPI(headersParam: HTTPHeaders([httpHeader]))
        return api.request()
    }
}

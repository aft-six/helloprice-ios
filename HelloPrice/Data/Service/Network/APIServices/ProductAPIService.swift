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
    
    func registerProduct(productCode: String) -> Single<RegistProductResponse> {
        
        let data = RegistProductRequestBody(productCode: productCode)
        let api = ProductRegistrationAPI(bodyData: data)
        return api.request()
    }
}

//
//  ProductRegistrationAPI.swift
//  HelloPrice
//
//  Created by devming on 2020/08/28.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class ProductRegistrationAPI: BaseAPI<RegistProductRequestBody, RegistProductResponse> {
    override var path: String {
        return "products"
    }
    
    override var method: HTTPMethod {
        return .post
    }
}


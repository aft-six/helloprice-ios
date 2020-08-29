//
//  TopDecreasedProductFetchingAPI.swift
//  HelloPrice
//
//  Created by devming on 2020/08/28.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class TopDecreasedProductFetchingAPI: BaseAPI<NoBody, FetchTopDecreaseProductResponse> {
    override var path: String {
        return "product-sales/top-decrease"
    }
    
    override var method: HTTPMethod {
        return .get
    }
}


//
//  MyProductFetchingAPI.swift
//  HelloPrice
//
//  Created by devming on 2020/08/28.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class MyProductFetchingAPI: BaseAPI<FetchMyProductByCategoryRequest, FetchMyProductResponse> {
    override var path: String {
        return "my/notifies"
    }
    
    override var method: HTTPMethod {
        return .get
    }
    
}

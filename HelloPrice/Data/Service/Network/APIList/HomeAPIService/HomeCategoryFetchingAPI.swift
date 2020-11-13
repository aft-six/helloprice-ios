//
//  HomeCategoryFetchingAPI.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift
import Alamofire

class HomeCategoryFetchingAPI: BaseAPI<NoBody, FetchHomeCategoryResponse> {
    override var path: String {
        return "categories"
    }
    
    override var method: HTTPMethod {
        return .post
    }
}

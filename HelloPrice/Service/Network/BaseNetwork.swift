//
//  BaseNetwork.swift
//  HelloPrice
//
//  Created by devming on 2020/06/28.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire

class BaseNetwork: NSObject {
    
    static func request(path: String,
                        method: HTTPMethod = .get,
                        headers: HTTPHeaders? = nil,
                        body: [String: String]? = nil) {
        guard let url = URL(string: path) else {
            return
        }
        
        let request = try? URLRequest(url: url, method: method, headers: headers)
//        request?.httpBody = body
        
    }
}

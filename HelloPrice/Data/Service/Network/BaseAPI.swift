//
//  BaseAPI.swift
//  HelloPrice
//
//  Created by devming on 2020/08/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol APIType {}

protocol APIServiceProtocol: APIType {
    associatedtype T
    func request() -> Single<T>
    
    var host: String { get }
    var version: String { get }
    var path: String { get }
    var url: String { get }
    var timeoutInterval: TimeInterval { get set }
    var body: Data? { get set }
    var parameters: [String: String]? { get set }
    var headers: HTTPHeaders? { get set }
    var method: HTTPMethod { get }
}

class BaseAPI<T: Encodable, R: Decodable>: APIServiceProtocol {
        
    var host: String {
        return "http://helloprice.podo-dev.com"
    }
    
    var version: String {
        return "v0"
    }
    
    var path: String {
        return ""
    }
    
    var url: String {
        return "\(host)/api/\(version)/\(path)"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var body: Data? = nil
    var timeoutInterval: TimeInterval = 10.0
    var headers: HTTPHeaders? = nil
    var parameters: HTTPParameters? = nil
    
    init(bodyData: T? = nil) {
        if let bodyData = bodyData {
            self.body = NetworkProvider.convertRequestBody(bodyData)
        }
    }
    
    func request() -> Single<R> {
        return NetworkProvider.requestObject(path: url,
                                             method: method,
                                             parameters: parameters,
                                             body: body,
                                             headers: headers,
                                             timeoutInterval: timeoutInterval)
    }
}

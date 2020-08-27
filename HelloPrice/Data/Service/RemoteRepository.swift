//
//  RemoteRepository.swift
//  HelloPrice
//
//  Created by devming on 2020/08/11.
//  Copyright © 2020 besteyes. All rights reserved.
//

/// API 참조 링크
/// https://github.com/besteyes/helloprice-server/tree/feature/refactor3/helloprice-api

import Alamofire
import RxSwift

protocol RemoteRepository: class {
    associatedtype HTTPMethod
    associatedtype HTTPHeaders
    
    static func convertRequestBody<T>(_ object: T) -> Data? where T: Encodable
    static func requestObject<T: Decodable>(path: String,
                              method: HTTPMethod,
                              parameters: HTTPParameters?,
                              body: Data?,
                              headers: HTTPHeaders?,
                              timeoutInterval: TimeInterval) -> Single<T>
}

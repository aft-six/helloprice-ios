//
//  BaseNetwork.swift
//  HelloPrice
//
//  Created by devming on 2020/06/28.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift
import Alamofire
import RxAlamofire
import Foundation

enum NetworkResult {
    case success
    case userError
    case serverError
    case unknownError
}

typealias HTTPParameters = [String : String]

class NetworkProvider: NSObject, RemoteRepository {
    
    typealias HTTPMethod = Alamofire.HTTPMethod
    typealias HTTPHeaders = Alamofire.HTTPHeaders
    
    static func convertRequestBody<T>(_ object: T) -> Data? where T: Encodable {
        do {
            let data = try JSONEncoder().encode(object)
            return data
        } catch {}
        return nil
    }
    
    static private func request(path: String,
                        method: HTTPMethod = .get,
                        parameters: HTTPParameters? = nil,
                        headers: HTTPHeaders? = nil,
                        body: Data? = nil,
                        timeoutInterval: TimeInterval = 10.0) -> Observable<(HTTPURLResponse, Data)> {
        
        let encoding = URLEncoding.default
        var originalRequest: URLRequest?
        do {
            var httpHeaders: HTTPHeaders?
            if let headers = headers {
                httpHeaders = headers
            }
            originalRequest = try URLRequest(url: URL(string: path)!,
                                             method: method,
                                             headers: httpHeaders)
            if let param = parameters {
                let encodedURLRequest = try encoding.encode(originalRequest!, with: param)
                originalRequest = encodedURLRequest
            }
            originalRequest?.httpBody = body
            originalRequest?.timeoutInterval = timeoutInterval
            
            let ret = RxAlamofire.requestData(originalRequest!)
            #if DEBUG
            return ret.debug()
            #else
            return ret
            #endif
        } catch {
            let observable: Observable<(HTTPURLResponse, Data)> = Observable.create { subscriber -> Disposable in
                subscriber.onError(error)
                return Disposables.create()
            }
            return observable
        }
    }
    
    static func requestObject<T: Decodable>(path: String,
                                method: HTTPMethod,
                                parameters: HTTPParameters? = nil,
                                body: Data? = nil,
                                headers: HTTPHeaders? = nil,
                                timeoutInterval: TimeInterval = 10.0) -> Single<T> {
        
        let observable: Observable<T> = Observable.create { subscriber -> Disposable in
            
            return request(path: path, method: method, parameters: parameters, headers: headers, body: body, timeoutInterval: timeoutInterval)
                .do(onError: { error in
                        subscriber.onError(error)
                })
                .subscribe(onNext: { (response, data) in
                    do {
                        switch response.networkResult {
                        case .success:
                            let object: T = try JSONDecoder().decode(T.self, from: data)
                            subscriber.onNext(object)
                            subscriber.onCompleted()
                        case .userError:
                            let error = NSError(domain: "유저 에러",
                                                code: response.statusCode,
                                                userInfo: nil)
                            subscriber.onError(error)
                        case .serverError:
                            let error = NSError(domain: "서버 에러",
                                                code: response.statusCode,
                                                userInfo: nil)
                            subscriber.onError(error)
                        case .unknownError:
                            let error = NSError(domain: "알 수 없는 에러",
                                                code: response.statusCode,
                                                userInfo: nil)
                            subscriber.onError(error)
                        }
                    } catch {}
                    
                })
        }
        
        return observable.asSingle()
    }
}

extension HTTPURLResponse {
    var networkResult: NetworkResult {
        switch statusCode {
        case 200..<300:
            return .success
        case 400..<500:
            return .userError
        case 500..<600:
            return .serverError
        default:
            return .unknownError
        }
    }
}


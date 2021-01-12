//
//  BaseLocalDBService.swift
//  HelloPrice
//
//  Created by devming on 2021/01/10.
//  Copyright © 2021 besteyes. All rights reserved.
//

import RealmSwift
import RxSwift

protocol LocalServiceType {
    associatedtype T
    
    func fetch(object: T?) -> Single<[T]>
    func update(origin: T, updated: [String: Any])
    func delete(object: T)
}

class BaseLocalDBService: LocalServiceType {
    typealias T = Object
    
    func fetch(object: T? = nil) -> Single<[T]> {
        return Single.just(RealmManager.shared.fetch(object: object).map { $0.freeze() })
//        return RealmManager.shared.fetch(object: object).map { $0.freeze() }
    }
    
    func update(origin: T, updated: [String: Any]) {
        RealmManager.shared.update(data: origin, updatedDict: updated)
    }
    
    func delete(object: T) {
        RealmManager.shared.delete(object: object)
    }
    
    
}

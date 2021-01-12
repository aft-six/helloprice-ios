//
//  LocalDBService.swift
//  HelloPrice
//
//  Created by devming on 2020/08/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    typealias T = Object
    
    static let shared = RealmManager()
    private let realm: Realm
    private let schemeVersion: UInt64 = 0
    
    private init() {
        var config = Realm.Configuration()
        config.schemaVersion = schemeVersion
//        config.migrationBlock = { migration, version in
//            migration.
//        }
        self.realm = try! Realm(configuration: config)
    }
    
    func add(object: T) {
        try? realm.write {
            realm.add(object, update: .all)
        }
    }
    
    func fetch(object: T? = nil) -> Results<T> {
        return realm.objects(T.self)
    }
    
    func update(data: T, updatedDict: [String: Any]) {
        try? realm.write {
            realm.create(T.self, value: updatedDict, update: .modified)
        }
    }
    
    func delete(object: T) {
        try? realm.write {
            realm.delete(object)
        }
    }
    
}

extension Object: DomainObject { }

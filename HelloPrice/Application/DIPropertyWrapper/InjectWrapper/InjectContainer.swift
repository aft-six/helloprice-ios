//
//  InjectContainer.swift
//  HelloPrice
//
//  Created by devming on 2020/12/01.
//  Copyright © 2020 besteyes. All rights reserved.
//

//@propertyWrapper
//struct InjectContainer<T: DIContainerType> {
//    var container: T
//    
//    init(local: LocalRepository? = nil, remote: APIType? = nil) {
//        self.container = Resolver.shared.resolve(T.self)
//        self.localService = local
//        self.apiService = remote
//    }
//    
//    var wrappedValue: T {
//        get {
//            return container
//        }
//        mutating set {
//            container = newValue
//        }
//    }
//}

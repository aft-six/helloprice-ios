//
//  InjectUseCase.swift
//  HelloPrice
//
//  Created by devming on 2020/12/03.
//  Copyright © 2020 besteyes. All rights reserved.
//

@propertyWrapper
struct InjectUseCase<T: UseCase> {
    var container: T
    
    init() {
        self.container = Resolver.shared.resolve(T.self)
    }
    
    var wrappedValue: T {
        get {
            return container
        }
        mutating set {
            container = newValue
        }
    }
}

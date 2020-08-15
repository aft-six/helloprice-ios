//
//  ShowMyProductListUseCaseImpl.swift
//  HelloPrice
//
//  Created by devming on 2020/08/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

class ShowMyProductListUseCaseImpl: ShowMyProductListUseCase {
    
    init() {
        
    }
    
    func excute() -> Single<[Product]> {
        
        return Observable.of([Product()]).asSingle()
    }
    
    
}

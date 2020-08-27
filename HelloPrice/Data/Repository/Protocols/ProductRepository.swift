//
//  ProductRepository.swift
//  HelloPrice
//
//  Created by devming on 2020/08/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

protocol ProductRepository: RepositoryType {
    
    func fetchMyProducts() -> Single<[Product]>
}

//
//  MemoryStorage.swift
//  HelloPrice
//
//  Created by devming on 2020/06/29.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

class MemoryStorage: ProductStorageType {
    
    private var list = [Product]()
    private lazy var productSubject = BehaviorSubject<[Product]>(value: list)
    
    func loadSearchedProducts(contents: String) -> Observable<Product> {
//        let product = Product()
//        self.list.insert(product, at: 0)
//        emitter.onNext(product)
//        return Disposables.create()        
        
        // TODO: API call
        let product = Product()
        list.insert(product, at: 0)
        productSubject.onNext(list)
        
        return Observable.just(product)
    }
    
    func loadedProductList() -> Observable<[Product]> {
        return productSubject
    }
    
    func deleteProduct(product: Product) -> Observable<Product> {
        if let index = list.firstIndex(where: { $0 == product }) {
            list.remove(at: index)
        }
        
        productSubject.onNext(list)
        
        return Observable.just(product)
    }
    
    
}

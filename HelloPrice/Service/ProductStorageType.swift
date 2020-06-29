//
//  ProductStorageType.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation
import RxSwift

protocol ProductStorageType {
    @discardableResult
    func loadSearchedProducts(contents: String) -> Observable<Product>

    @discardableResult
    func loadedProductList() -> Observable<[Product]>
    
    @discardableResult
    func deleteProduct(product: Product) -> Observable<Product>
}

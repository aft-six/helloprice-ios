//
//  ShowMyProductListUseCaseMock.swift
//  HelloPrice
//
//  Created by devming on 2020/08/16.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

class ShowMyProductListUseCaseMock: ShowMyProductListUseCase {
    func excute() -> Single<[Product]> {
        
        let products = [
            Product(id: 1,
                    productName: "p1",
                    productCode: "code1",
                    description: "desc1",
                    url: "url",
                    imageUrl: "pencil",
                    saleType: "salesType1",
                    price: 1,
                    prevPrice: 0,
                    additionalInfo: "additionalInfo1",
                    priceChangeRate: 1,
                    lastUpdateAt: "last1",
                    notifyOn: false)
        ]
        
        return Observable.of(products).asSingle()
    }
}

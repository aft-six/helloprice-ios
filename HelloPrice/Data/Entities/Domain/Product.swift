//
//  Product.swift
//  HelloPrice
//
//  Created by devming on 2020/06/03.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

struct Product: DomainObject {
    var id: Int = 0
    var productName: String?
    var productCode: String?
    var url: String?
    var imageUrl: String?
    var description: String?
    var saleStatus: String?
    var saleType: String?
    var price: Int?
    var prevPrice: Int?
    var additionalInfo: String?
    var priceChangeRate: Double?
    var lowestPrice: Int?
    var lastUpdateAt: String?
    var notifyOn: Bool = false
    
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}

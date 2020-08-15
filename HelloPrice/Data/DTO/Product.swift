//
//  Product.swift
//  HelloPrice
//
//  Created by devming on 2020/06/03.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

struct Product: Equatable, Decodable {
    var id: Int = 0
    var productName: String = ""
    var productCode: String = ""
    var description: String = ""
    var url: String = ""
    var imageUrl: String = ""
    var saleType: String = ""
    var price: Int = 0
    var prevPrice: Int = 0
    var additionalInfo: String = ""
    var priceChangeRate: Int = 0
    var lastUpdateAt: String = ""
    var notifyOn: Bool = false
}

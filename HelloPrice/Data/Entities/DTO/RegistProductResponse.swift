//
//  RegistProductResponse.swift
//  HelloPrice
//
//  Created by devming on 2020/08/28.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

struct RegistProductResponse: Decodable {
    var id: Int?
    var productSales: [ProductSales]
}

enum SaleType: String, Decodable {
    case normal = "NORMAL"
    case cash = "CASH"
    case card = "CARD"
}

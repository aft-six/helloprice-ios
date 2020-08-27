//
//  RegistProductResponse.swift
//  HelloPrice
//
//  Created by devming on 2020/08/28.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

struct RegistProductResponse: Decodable {
    var id: Int
    var productSales: [ProductSales]
}

struct ProductSales: Decodable {
    var id: Int
    var saleType: String
}

//
//  NofifiedProduct.swift
//  HelloPrice
//
//  Created by devming on 2020/06/03.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

struct NofifiedProduct: Equatable, Decodable {
    var size: Int?
    var constents: [NotifiedProductContents]?
}

struct NotifiedProductContents: Equatable, Decodable {
    var id: Int?
    var productCode: String?
    var productName: String?
    var url: String?
    var imageUrl: String?
    var description: String?
    var saleStatus: String?
    var lastConfirmAt: String?
    var productSales: [Product]?
}

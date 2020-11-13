//
//  FetchMyProductResponse.swift
//  HelloPrice
//
//  Created by devming on 2020/06/03.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

struct FetchMyProductResponse: Decodable {
    var size: Int?
    var contents: [NotifiedProductContents]?
}

struct NotifiedProductContents: Decodable {
    var id: Int?
    var lowestPrice: Int? = 0
    var product: MyProductResponse?
}

struct MyProductResponse: Decodable {
    var id: Int?
    var productCode: String?
    var productName: String?
    var url: String?
    var imageUrl: String?
    var description: String?
    var saleStatus: String?
    var lastConfirmAt: String?
    var productSale: ProductSales?
}

struct ProductSales: Decodable {
    var id: Int?
    var saleType: String?
    var price: Int? = 0
    var prevPrice: Int? = 0
    var priceChangeRate: Double? = 0.0
    var additionalInfo: String? = ""
}

enum SaleStatus: String, Decodable {
    case sale = "SALE"
    case discontinue = "DISCONTINUE"
    case emptyAmount = "EMPTY_AMOUNT"
    case notSupport = "NOT_SUPPORT"
    case unknown = "UNKNOWN"
}

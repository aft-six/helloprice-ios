//
//  FetchTopDecreaseProductResponse.swift
//  HelloPrice
//
//  Created by devming on 2020/08/28.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

struct FetchTopDecreaseProductResponse: Decodable {
    var id: Int
    var productId: Int
    var productName: String
    var productCode: String
    var description: String
    var url: String
    var imageUrl: String
    var saleType: String
    var price: Int
    var prevPrice: Int
    var additionalInfo: String
    var priceChangeRate: Double
    var lastUpdateAt: String
    var notifyOn: Bool
}

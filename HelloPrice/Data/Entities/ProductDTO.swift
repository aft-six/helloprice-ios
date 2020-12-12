//
//  ProductDTO.swift
//  HelloPrice
//
//  Created by devming on 2020/06/03.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

struct ProductDTO: Decodable {
    var id: Int = 0
    var productName: String = ""
    var productCode: String = ""
    var url: String = ""
    var imageUrl: String = ""
    var description: String = ""
    var saleStatus: String? = ""
    var saleType: String = ""
    var price: Int = 0
    var prevPrice: Int = 0
    var additionalInfo: String = ""
    var priceChangeRate: Double? = 0
    var lowestPrice: Int? = 0
    var lastUpdateAt: String = ""
    var notifyOn: Bool = false
    
    static func ==(lhs: ProductDTO, rhs: ProductDTO) -> Bool {
        return lhs.id == rhs.id
    }
}

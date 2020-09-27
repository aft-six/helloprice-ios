//
//  String+Extension.swift
//  HelloPrice
//
//  Created by devming on 2020/09/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

extension String {
    enum PaymentMethod: String {
        case card = "CARD"
        case cash = "CASH"
        case normal = "NORMAL"
        case invalid = "INVALID"
    }
    
    var paymentMethod: PaymentMethod {
        return PaymentMethod(rawValue: self) ?? .invalid
    }
}

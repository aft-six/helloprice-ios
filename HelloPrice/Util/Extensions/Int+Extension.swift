//
//  Int+Extension.swift
//  HelloPrice
//
//  Created by devming on 2020/12/01.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

extension Int {
    var won: String {
        return decimalWon(value: self)
    }
    
    private func decimalWon(value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: value))! + " 원"
    }
}

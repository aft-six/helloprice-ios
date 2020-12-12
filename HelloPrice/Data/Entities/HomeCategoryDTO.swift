//
//  HomeCategory.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

struct HomeCategoryDTO: Decodable {
    var id: Int
    var title: String
    var products: [ProductDTO]
    
    var categoryField: HomeCategoryField {
        return HomeCategoryField(rawValue: id) ?? HomeCategoryField.all
    }
}

enum HomeCategoryField: Int {
    case all
    case customerElectric
    case computer
    case mobile
    case sportsWear
    case car
    case furniture
    case food
    case living
    case fashion
    case working
    case travel
}

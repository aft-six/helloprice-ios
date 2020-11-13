//
//  HomeCategory.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

struct HomeCategory: Item, Decodable {
    var id: String
    var title: String
    var products: [Product]
}

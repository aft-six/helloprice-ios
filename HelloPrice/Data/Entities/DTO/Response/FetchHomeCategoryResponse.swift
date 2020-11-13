//
//  FetchHomeCategoryResponse.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

struct FetchHomeCategoryResponse: Decodable {
    var size: Int
    var contents: [Content]
    
    struct Content: Decodable {
        var id: Int
        var value: String
    }
}

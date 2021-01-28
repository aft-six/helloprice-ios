//
//  SearchRecentObject.swift
//  HelloPrice
//
//  Created by devming on 2021/01/03.
//  Copyright © 2021 besteyes. All rights reserved.
//

import RxSwift

struct SearchRecentObject: DomainObject {
    
    var title: String
    var url: String?
    var updatedDate: String
    var searchTypeString: String
    
    var id: String {
        return "\(searchType)_\(title)"
    }
    var searchType: SearchType {
        return SearchType(rawValue: searchTypeString) ?? .name
    }
    
    static func == (lhs: SearchRecentObject, rhs: SearchRecentObject) -> Bool {
        return lhs.id == rhs.id
    }
}

enum SearchType: String, Equatable {
    case name
    case url
}

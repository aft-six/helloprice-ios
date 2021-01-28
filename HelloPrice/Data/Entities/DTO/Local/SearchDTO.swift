//
//  SearchDTO.swift
//  HelloPrice
//
//  Created by devming on 2021/01/05.
//  Copyright © 2021 besteyes. All rights reserved.
//

import Foundation
import RealmSwift

class SearchDTO: Object {
//    @objc dynamic var id: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var url: String = ""
    
    @objc dynamic var id: String {
        return "\(type)_\(title)"
    }
    
    var toDomain: SearchRecentObject {
        
        return SearchRecentObject(title: title, url: url, updatedDate: date, searchTypeString: type)
    }
}

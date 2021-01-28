//
//  SectionOfDomainObject.swift
//  HelloPrice
//
//  Created by devming on 2020/12/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxDataSources

struct SectionOfDomainObject<Object: DomainObject> {
    var header: String
    var items: [Item]
    
    init(items: [Item]) {
        self.header = ""
        self.items = items
    }
    
    init(header: String, items: [Item]) {
        self.header = header
        self.items = items
    }
}

extension SectionOfDomainObject: SectionModelType {
    typealias Item = Object
    
    init(original: SectionOfDomainObject<Object>, items: [Item]) {
        self = original
        self.items = items
    }
}

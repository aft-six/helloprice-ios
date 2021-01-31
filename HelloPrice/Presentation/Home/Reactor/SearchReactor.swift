//
//  SearchReactor.swift
//  HelloPrice
//
//  Created by devming on 2021/01/12.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class SearchReactor: Reactor {
    
    var initialState = State()
    enum Action {
        case fetchRecentSearches
    }
    
    enum Mutation {
        case recentSearches([SectionOfDomainObject<SearchRecentObject>])
    }
    
    struct State {
        var searchObjectList = [SectionOfDomainObject<SearchRecentObject>]()
    }
    
}

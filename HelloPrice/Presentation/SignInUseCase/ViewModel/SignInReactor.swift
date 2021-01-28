//
//  SignInReactor.swift
//  HelloPrice
//
//  Created by devming on 2020/08/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import ReactorKit

class SignInReactor: Reactor {
    
    var initialState = State()
    
    enum Action {
        case loginKakao
        case loginGoogle
        case loginApple
    }
    
    enum Mutation {
        
    }
    
    struct State {
        
    }
}

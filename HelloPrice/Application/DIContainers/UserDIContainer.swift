//
//  UserDIContainer.swift
//  HelloPrice
//
//  Created by devming on 2020/08/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation

final class UserDIContainer {
    
    func makeSignInViewModel() -> SignInViewModel {
        return SignInViewModel()
    }
    
    func makeSignUpViewModel() -> SignUpViewModel {
        return SignUpViewModel()
    }
}

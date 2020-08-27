//
//  ShowMyPageUseCase.swift
//  HelloPrice
//
//  Created by devming on 2020/08/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

protocol ShowMyPageUseCase {
    func fetchUserInfo() -> Single<User>
}

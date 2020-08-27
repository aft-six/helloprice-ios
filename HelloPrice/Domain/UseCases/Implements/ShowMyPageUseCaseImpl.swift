//
//  ShowMyPageUseCaseImpl.swift
//  HelloPrice
//
//  Created by devming on 2020/08/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

class ShowMyPageUseCaseImpl: ShowMyPageUseCase {
    
    let repository: MyPageRepository
    
    init(repository: MyPageRepository) {
        self.repository = repository
    }
    
    func fetchUserInfo() -> Single<User> {
        return repository.fetchMyInfo()
    }
    
}

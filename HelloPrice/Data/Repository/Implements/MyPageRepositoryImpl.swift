//
//  MyPageRepositoryImpl.swift
//  HelloPrice
//
//  Created by devming on 2020/08/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

final class MyPageRepositoryImpl: MyPageRepository {
    
    func fetchMyInfo() -> Single<User> {
        // apiservice로 호출
        return Single.just(User())
    }

}

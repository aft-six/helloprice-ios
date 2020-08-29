//
//  ShowMyProductListUseCaseMock.swift
//  HelloPrice
//
//  Created by devming on 2020/08/16.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

class ShowMyProductListUseCaseMock: ShowMyProductListUseCase {
    
    func fetchMyProducts() -> Single<FetchMyProductResponse> {
        
        return Single.just(FetchMyProductResponse(size: 1, contents: [NotifiedProductContents]()))
    }
}

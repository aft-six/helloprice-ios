//
//  AppDIContainer.swift
//  HelloPrice
//
//  Created by devming on 2020/08/16.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift


final class AppDIContainer {
    
    lazy var localDBService: LocalDBService = {
        LocalDBService()
    }()
    
    lazy var apiService: ProductAPIService = {
        ProductAPIService()
    }()
    
    lazy var userDIContainer: UserDIContainer = {
        UserDIContainer()
    }()

    lazy var productDIContainer: ProductDIContainer = {
        ProductDIContainer(localDBService: localDBService,
                           apiService: apiService)
    }()
}

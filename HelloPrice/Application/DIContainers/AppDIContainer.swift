//
//  AppDIContainer.swift
//  HelloPrice
//
//  Created by devming on 2020/08/16.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift


final class AppDIContainer {
    
//    lazy var localDBService: RealmManager = {
//        RealmManager()
//    }()
    
//    lazy var productAPIService: ProductAPIService = {
//        ProductAPIService()
//    }()
    
//    lazy var homeAPIService: HomeAPIService = {
//        HomeAPIService()
//    }()
    
    lazy var userDIContainer: UserDIContainer = {
        UserDIContainer()
    }()

    lazy var productDIContainer: ProductDIContainer = {
        ProductDIContainer(apiService: ProductAPIService())
    }()
    
    lazy var homeDIContainer: HomeDIContainer = {
        HomeDIContainer(apiService: HomeAPIService())
    }()
}

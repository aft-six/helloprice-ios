//
//  BaseViewModel.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift
import RxCocoa

class BaseViewModel: NSObject {
    let title: Driver<String>
    
    let sceneCoordinator: SceneCoordinatorType
//    let storage: MemoStorageType
    

    init(title: String, sceneCoordinator: SceneCoordinatorType) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
    }
}

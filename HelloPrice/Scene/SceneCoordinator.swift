//
//  SceneCoordinator.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinatorType {
    
    var window: UIWindow
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
        <#code#>
    }
    
    func close(animated: Bool) -> Completable {
        <#code#>
    }
    
    
}

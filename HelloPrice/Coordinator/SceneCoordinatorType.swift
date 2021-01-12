//
//  SceneCoordinatorType.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool)
    
    @discardableResult
    func close(animated: Bool) -> Completable
}

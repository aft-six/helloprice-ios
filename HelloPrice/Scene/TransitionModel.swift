//
//  TransitionModel.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError {
    case navigationControllerMissing
    case cannotPop
    case unknown
}

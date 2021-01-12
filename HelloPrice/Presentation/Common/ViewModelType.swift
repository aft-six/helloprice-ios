//
//  ViewModelType.swift
//  HelloPrice
//
//  Created by devming on 2020/08/14.
//  Copyright © 2020 besteyes. All rights reserved.
//

import RxSwift

protocol ViewModelType: Injectable {
//    associatedtype Input
//    associatedtype Output
    var 👜: DisposeBag { get set }
}

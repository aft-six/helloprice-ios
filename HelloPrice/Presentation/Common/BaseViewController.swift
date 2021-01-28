//
//  BaseViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift
import ReactorKit

class BaseViewController<R: Reactor>: UIViewController, StoryboardView {
    var disposeBag = DisposeBag()
    
    func bind(reactor: R) {
        fatalError("Must override this function.")
    }
}

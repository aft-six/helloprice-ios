//
//  Coordinator.swift
//  HelloPrice
//
//  Created by devming on 2021/01/27.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}

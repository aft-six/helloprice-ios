//
//  UIImage+Extension.swift
//  HelloPrice
//
//  Created by devming on 2020/12/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

enum ImageIdentifier: String {
    case temp = "signin"
    
    case notiOn = "iconNotiRegOn"
    case notiOff = "iconNotiRegOff"
//    case signIn = "signin"
}

extension UIImage {
    convenience init(identifier: ImageIdentifier) {
        self.init(named: identifier.rawValue)!
    }
}

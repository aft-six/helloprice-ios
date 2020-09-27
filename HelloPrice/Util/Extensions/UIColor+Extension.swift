//
//  UIColor+Extension.swift
//  HelloPrice
//
//  Created by devming on 2020/09/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: Int) {
        self.init(red: CGFloat(red)/255.0,
                  green: CGFloat(green)/255.0,
                  blue: CGFloat(blue)/255.0,
                  alpha: CGFloat(alpha)/255.0)
    }
}

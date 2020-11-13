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

extension UIColor {
    class var base3: UIColor { UIColor(named: "base3")! }
    class var base5: UIColor { UIColor(named: "base5")! }
    class var base10: UIColor { UIColor(named: "base10")! }
    class var base30: UIColor { UIColor(named: "base30")! }
    class var base100: UIColor { UIColor(named: "base100")! }
    class var baseLabel100: UIColor { UIColor(named: "baseLabel100")! }
    class var black100: UIColor { UIColor(named: "black100")! }
    class var darkIndigo30: UIColor { UIColor(named: "darkIndigo30")! }
    class var brightYellow: UIColor { UIColor(named: "brightYellow")! }
    class var orangeRed: UIColor { UIColor(named: "orangeRed")! }
    class var richBlue: UIColor { UIColor(named: "richBlue")! }
}

//
//  UIView+Extension.swift
//  HelloPrice
//
//  Created by devming on 2020/08/16.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    var className: String {
        return String.init(describing: self).components(separatedBy: ".").last!
    }
    
    class var className: String {
        return String.init(describing: self).components(separatedBy: ".").last!
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
//            layer.cornerRadius = newValue
            layer.cornerCurve = .circular
        }
    }
}

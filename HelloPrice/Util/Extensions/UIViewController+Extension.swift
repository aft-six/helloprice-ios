//
//  UIViewController+Extension.swift
//  HelloPrice
//
//  Created by devming on 2020/08/16.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

extension UIViewController {
    var className: String {
        return String.init(describing: self).components(separatedBy: ".").last!
    }
    
    class var className: String {
        return String.init(describing: self).components(separatedBy: ".").last!
    }
    
    var topSafeAreaHeight: CGFloat {
        return UIApplication.shared.windows.first?.safeAreaInsets.top ?? 47
    }
    
    var bottomSafeAreaHeight: CGFloat {
        return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 47
    }
}

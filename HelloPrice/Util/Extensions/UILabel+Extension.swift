//
//  UILabel+Extension.swift
//  HelloPrice
//
//  Created by devming on 2020/12/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

extension UILabel {
    func textWidth() -> CGFloat {
        return UILabel.textWidth(label: self)
    }
    
    class func textWidth(label: UILabel) -> CGFloat {
        return textWidth(label: label, text: label.text ?? "")
    }
    
    class func textWidth(label: UILabel, text: String) -> CGFloat {
        return textWidth(font: label.font, text: text)
    }
    
    class func textWidth(font: UIFont, text: String) -> CGFloat {
        let myText = text as NSString
        let rect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(labelSize.width)
    }
    
    func setColor(by num: Double) {
//        if num > 0 {
//            textColor = .red
//        }
    }
    
    func setMark(_ num: Double, head frontMark: String = "", tail endMark: String = "") {
        text = "\(frontMark)\(num)\(endMark)"
    }
    
    func setMark(_ num: Int, head frontMark: String = "", tail endMark: String = "") {
        text = "\(frontMark)\(num)\(endMark)"
    }
}

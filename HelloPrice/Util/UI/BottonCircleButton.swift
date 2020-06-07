//
//  BottonCircleButton.swift
//  HelloPrice
//
//  Created by devming on 2020/06/07.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

@IBDesignable
class BottonCircleButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = self.frame.height / 2.0
    }
}

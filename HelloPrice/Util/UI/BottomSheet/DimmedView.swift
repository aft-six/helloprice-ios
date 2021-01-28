//
//  DimmedView.swift
//  HelloPrice
//
//  Created by devming on 2021/01/12.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit

class DimmedView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    func setUI() {
        let dimmedViewTag = 9999
        tag = dimmedViewTag
        backgroundColor = .darkIndigo30
    }
}

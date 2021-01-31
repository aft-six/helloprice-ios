//
//  DimmedView.swift
//  ProjectVanilla
//
//  Created by devming on 2021/01/12.
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
    
    override func removeFromSuperview() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0.0
        }) { _ in
            super.removeFromSuperview()
        }
    }
    
    func setUI() {
        
        alpha = 0.0
        backgroundColor = .black60
    }
}

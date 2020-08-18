//
//  RootTabBarController.swift
//  HelloPrice
//
//  Created by devming on 2020/08/17.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButtonContainerView()
    }
    
    func createButtonContainerView() {
        let buttonView = FloatingAddButtonView()
        view.addSubview(buttonView)
        buttonView.translatesAutoresizingMaskIntoConstraints = false

        // anchor your view right above the tabBar
        buttonView.centerYAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        createAddButton(buttonView: buttonView)
    }
    
    func createAddButton(buttonView: FloatingAddButtonView) {
        
        let addButton = UIButton()
        let buttonImage: UIImage
        if #available(iOS 13.0, *) {
            buttonImage = UIImage(systemName: "plus.circle.fill")!
        } else {
            buttonImage = UIImage(named: "button")!
        }
        addButton.setImage(buttonImage, for: .normal)
        buttonView.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        addButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor).isActive = true
        addButton.widthAnchor.constraint(equalTo: buttonView.widthAnchor).isActive = true
        addButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor).isActive = true
        addButton.contentVerticalAlignment = .fill
        addButton.contentHorizontalAlignment = .fill
        
        addButton.layer.zPosition = 1
    }
}

class FloatingAddButtonView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let origin = CGPoint(x: rect.width / 2, y: rect.height / 2)
        path.move(to: origin)
        
        path.addArc(withCenter: origin, radius: 35, startAngle: .pi, endAngle: .zero, clockwise: true)
        
        let fillLayer = CAShapeLayer()
        fillLayer.path = path.cgPath
        fillLayer.fillColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8).cgColor
        layer.addSublayer(fillLayer)
    }
    
    
}

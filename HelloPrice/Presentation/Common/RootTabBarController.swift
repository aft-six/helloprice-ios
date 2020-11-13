//
//  RootTabBarController.swift
//  HelloPrice
//
//  Created by devming on 2020/08/17.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {
    
    struct AddButtonState {
        var isOpen = false
    }
    
    var buttonState = AddButtonState()
    let buttonBackView = FloatingAddButtonView()
    let subButtonBackView = UIView()
    var productNameSearchToAddButton: UIButton!
    var urlSearchToAddButton: UIButton!
    let subButtonsPosition: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subButtonBackView.alpha = 0
        subButtonBackView.backgroundColor = .clear
//        createButtonContainerView(containerView: subButtonBackView, size: 100)
//        productNameSearchToAddButton =
//            createSubButton(parentView: subButtonBackView,
//                            buttonImage: UIImage(named: "ic_product_search")!, position: -subButtonsPosition)
//        //magnifyingglass
//        productNameSearchToAddButton.addTarget(self,
//                                               action: #selector(searchProductNameButton),
//                                               for: .touchUpInside)
//        urlSearchToAddButton = createSubButton(parentView: subButtonBackView,
//                                               buttonImage: UIImage(named: "ic_product_url_search")!,
//                                               position: subButtonsPosition)
//        
//        createButtonContainerView(containerView: buttonBackView, size: 60)
//        createAddButton(parentView: buttonBackView,
//                        buttonImage: UIImage(systemName: "plus.circle.fill")!)
//        urlSearchToAddButton.addTarget(self,
//                                       action: #selector(searchLinkButton),
//                                       for: .touchUpInside)
//        effectClick(productNameSearchToAddButton)
//        effectClick(urlSearchToAddButton)
        
    }
}

extension RootTabBarController {
    func initViewControllers(viewControllers: [UIViewController]) {
        
        viewControllers.forEach {
            let nav = UINavigationController(rootViewController: $0)
            self.addChild(nav)
            
            if $0 is HomeViewController {
                nav.navigationBar.backgroundColor = .richBlue
                nav.navigationBar.prefersLargeTitles = true
                nav.navigationBar.largeTitleTextAttributes =
                    [NSAttributedString.Key.foregroundColor: UIColor.white,
                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold)]
            }
//            UIFont(name: "S-CoreDream-9Black", size: 28)
        }
    }
}

/// Create TabBar UI & Animation
extension RootTabBarController {
    
    private func createButtonContainerView(containerView: UIView, size constant: CGFloat) {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.centerYAnchor
            .constraint(equalTo: tabBar.topAnchor)
            .isActive = true
        containerView.centerXAnchor
            .constraint(equalTo: view.centerXAnchor)
            .isActive = true
        containerView.widthAnchor
            .constraint(equalToConstant: constant)
            .isActive = true
        containerView.heightAnchor
            .constraint(equalToConstant: constant)
            .isActive = true
    }
    
    private func createAddButton(parentView: UIView, buttonImage: UIImage) {
        
        let addButton = UIButton()
        
        parentView.addSubview(addButton)
        addButton.setImage(buttonImage, for: .normal)
        addButton.contentVerticalAlignment = .fill
        addButton.contentHorizontalAlignment = .fill
        makeAddButtonConstraint(addButton: addButton, parentView: parentView)
        
        let topPosition: CGFloat = 1
        addButton.layer.zPosition = topPosition
        
        addButton.addTarget(self,
                            action: #selector(renderButtons(_:)),
                            for: .touchUpInside)
    }
    
    private func makeAddButtonConstraint(addButton: UIButton, parentView: UIView) {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.centerYAnchor
            .constraint(equalTo: parentView.centerYAnchor)
            .isActive = true
        addButton.centerXAnchor
            .constraint(equalTo: parentView.centerXAnchor)
            .isActive = true
        addButton.widthAnchor
            .constraint(equalTo: parentView.widthAnchor)
            .isActive = true
        addButton.heightAnchor
            .constraint(equalTo: parentView.heightAnchor)
            .isActive = true
    }
    
    @objc func renderButtons(_ sender: UIButton) {
        
        let addButtonAngle: CGFloat = CGFloat(Double.pi / 2)
        let subButtonAngle: CGFloat = CGFloat(Double.pi)
        let subButtonAlpha: CGFloat = self.buttonState.isOpen
            ? 0
            : 1
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.subButtonBackView.alpha = subButtonAlpha
            
            self.subButtonBackView.transform =
                self.subButtonBackView.transform.rotated(by: subButtonAngle)
        })
        
        UIView.animate(withDuration: 0.1) {
            
            sender.transform = sender.transform.rotated(by: addButtonAngle)
            
            self.buttonState.isOpen = !self.buttonState.isOpen
        }
    }
    
    private func createSubButton(parentView: UIView, buttonImage: UIImage, position: CGFloat) -> UIButton {
        
        //        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let button = UIButton()
        parentView.addSubview(button)
        button.setImage(buttonImage, for: .normal)
        makeSubButtonConstraint(button: button, parentView: parentView)
        // TODO: 버튼 모양은 회전하지 않도록 수정하자.
        button.transform = button.transform.translatedBy(x: 0, y: 0)
        button.transform = button.transform.rotated(by: CGFloat(Double.pi))
        button.transform = button.transform.translatedBy(x: position, y: -subButtonsPosition)
        button.transform = button.transform.scaledBy(x: 0.5, y: 0.5)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 5
        button.layer.cornerRadius = 50
        
        return button
    }
    
    private func makeSubButtonConstraint(button: UIButton, parentView: UIView) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor
            .constraint(equalTo: parentView.centerYAnchor)
            .isActive = true
        button.centerXAnchor
            .constraint(equalTo: parentView.centerXAnchor)
            .isActive = true
        button.widthAnchor
            .constraint(equalTo: parentView.widthAnchor)
            .isActive = true
        button.heightAnchor
            .constraint(equalTo: parentView.heightAnchor)
            .isActive = true
    }
    
    @objc private func searchProductNameButton(_ sender: UIButton) {
        effectClick(sender)
        print("\(#function) 클릭")
    }
    
    @objc private func searchLinkButton(_ sender: UIButton) {
        effectClick(sender)
        print("\(#function) 클릭")
    }
    
    @objc private func effectFadeIn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
                        sender.alpha = 0.5
        })
    }
    @objc private func effectFadeOut(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
                        sender.alpha = 1.0
        })
    }
    private func effectClick(_ sender: UIButton) {
        
        sender.addTarget(self,
                         action: #selector(effectFadeIn),
                         for: .touchDown)
        sender.addTarget(self,
                         action: #selector(effectFadeOut),
                         for: [.touchUpOutside, .touchUpInside, .touchCancel])
    }
}

class FloatingAddButtonView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let origin = CGPoint(x: rect.width / 2,
                             y: rect.height / 2)
        let fillLayer = CAShapeLayer()
        let translucentWhite = UIColor(red: 1.0,
                                       green: 1.0,
                                       blue: 1.0,
                                       alpha: 0.8)
        
        path.move(to: origin)
        path.addArc(withCenter: origin,
                    radius: 35,
                    startAngle: .pi,
                    endAngle: .zero,
                    clockwise: true)
        
        fillLayer.path = path.cgPath
        fillLayer.fillColor = translucentWhite.cgColor
        layer.addSublayer(fillLayer)
    }
    
    
}

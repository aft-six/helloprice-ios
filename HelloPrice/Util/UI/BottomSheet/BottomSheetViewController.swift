//
//  BottomSheetViewController.swift
//  BottomSheet
//
//  Created by Ahmed Elassuty on 7/1/16.
//  Copyright © 2016 Ahmed Elassuty. All rights reserved.
//

import UIKit

class BottomSheetViewController: UIViewController, BottomSheetViewControllerType {
    // holdView can be UIImageView instead
    private var headerView: UIView
    private var mainView: UIView
    
    private var topMargin: CGFloat = 100
    private var partialView: CGFloat {
        return UIScreen.main.bounds.height - 150
//        let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? topSafeAreaHeight
//        return UIScreen.main.bounds.height - statusBarHeight
    }
    
    required init?(coder: NSCoder) {
        headerView = UIView(frame: CGRect.zero)
        mainView = UIView(frame: CGRect.zero)

        super.init(coder: coder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        headerView = UIView(frame: CGRect.zero)
        mainView = UIView(frame: CGRect.zero)

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(BottomSheetViewController.panGesture))
        view.addGestureRecognizer(gesture)
        
        layoutViews()
    }
    
    func layoutViews() {
        headerView.cornerRadius = 10
        headerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        headerView.backgroundColor = .base100
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 30),
            view.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
        ])
        let holder = UIView()
        holder.cornerRadius = 3
        holder.backgroundColor = .darkIndigo30
        headerView.addSubview(holder)
        holder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.centerXAnchor.constraint(equalTo: holder.centerXAnchor),
            headerView.centerYAnchor.constraint(equalTo: holder.centerYAnchor),
            holder.widthAnchor.constraint(equalToConstant: 60),
            holder.heightAnchor.constraint(equalToConstant: 6)
        ])
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.bottomAnchor.constraint(equalTo: mainView.topAnchor),
            view.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6, animations: {
            let frame = self.view.frame
            let yComponent = self.topMargin
            self.view.frame = CGRect(x: 0, y: yComponent, width: frame.width, height: frame.height - 100)
        }) 
    }
    
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        let velocity = recognizer.velocity(in: self.view)
        let y = self.view.frame.minY
        if ( y + translation.y >= topMargin) && (y + translation.y <= partialView ) {
            self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
        
        if recognizer.state == .ended {
            var duration =  velocity.y < 0 ? Double((y - topMargin) / -velocity.y) : Double((partialView - y) / velocity.y )
            
            duration = duration > 1.3 ? 1 : duration
            
            UIView.animate(withDuration: duration, delay: 0.0, options: [.allowUserInteraction], animations: {
                if velocity.y >= 0 {
                    self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: self.view.frame.width, height: self.view.frame.height)
                } else {
                    self.view.frame = CGRect(x: 0, y: self.topMargin, width: self.view.frame.width, height: self.view.frame.height)
                }
                
                }, completion:{ [weak self] _ in
                    if velocity.y >= 0 {
                        self?.view.removeFromSuperview()
                        self?.parent?.view.subviews.filter { $0 is DimmedView }.first?.removeFromSuperview()
                    } 
            })
        }
    }

    func addBottomSheetMainView(_ bottomSheetView: UIView) {
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(bottomSheetView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: bottomSheetView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomSheetView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor)
        ])
    }
    
    func setTopMargin(value: CGFloat) {
        topMargin = value
    }
}

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
    
    func addBottomSheetView(viewController bottomSheetViewController: BottomSheetViewControllerType) {
        
        let dimmedView = DimmedView()
        view.addSubview(dimmedView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: dimmedView.topAnchor),
            view.bottomAnchor.constraint(equalTo: dimmedView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: dimmedView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: dimmedView.trailingAnchor)
        ])
        
        let bottomSheetVC = bottomSheetViewController
        if !self.children.contains(bottomSheetVC) {
            self.addChild(bottomSheetVC)
        }
        self.view.addSubview(bottomSheetVC.view)
        bottomSheetVC.didMove(toParent: self)

        let height = view.frame.height
        let width  = view.frame.width
        bottomSheetVC.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: width, height: height)
        
    }
}

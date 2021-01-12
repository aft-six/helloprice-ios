//
//  UICollectionView+Extension.swift
//  HelloPrice
//
//  Created by devming on 2020/12/16.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

extension UICollectionView {
    func reloadDataWithCompletion(_ complete: @escaping () -> Void) {
        reloadData()
        complete()
        layoutSubviews()
    }
}

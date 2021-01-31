//
//  HomeCellType.swift
//  HelloPrice
//
//  Created by devming on 2020/12/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

enum HomeCellType {
    case category
    case main
    
    var identifier: String {
        switch self {
        case .category:
            return HomeCategoryItemCell.identifier
        case .main:
            return HomeMainItemCell.identifier
        }
    }
    
    var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

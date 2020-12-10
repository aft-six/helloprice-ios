//
//  CategoryItemCell.swift
//  HelloPrice
//
//  Created by devming on 2020/11/21.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CategoryItemCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func configure(category: HomeCategory) {
        var imageName = ""
        var titleName = ""
        switch category.categoryField {
        case .all:
            imageName = "iconCategoryAll"
            titleName = ""
            break
        case .customerElectric:
            imageName = "iconCategoryElectronic"
            break
        default:
            break
        }
        
        categoryImageView.image = UIImage(named: imageName)
        categoryTitleLabel.text = titleName
    }
}

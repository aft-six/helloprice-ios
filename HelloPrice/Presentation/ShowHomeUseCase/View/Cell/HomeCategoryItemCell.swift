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

class HomeCategoryItemCell: BaseCollectionViewCell<HomeCategoryItemCellViewModel, HomeCategoryItemCellViewModel.Output, HomeCategory> {
    
    @IBOutlet weak var logoImageView: UIImageView! {
        didSet {
            logoImageView.tintColor = .darkIndigoText100
        }
    }
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    override var isSelected: Bool {
        didSet {
            cellBackground.backgroundColor = isSelected ? .darkIndigoText100 : .darkIndigo5
            logoImageView.tintColor = isSelected ?
                .lightIndigoText100 : .darkIndigoText100
            categoryLabel.textColor = isSelected ?
                .lightIndigoText100 : .darkIndigoText100
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initView()
    }
    
    func initView() {
        cellBackground.layer.cornerRadius = cellBackground.frame.height/2
        cellBackground.layer.cornerCurve = .circular
    }
    
    func configure(category: HomeCategory) {
        
        categoryLabel.text = category.title
    }
}

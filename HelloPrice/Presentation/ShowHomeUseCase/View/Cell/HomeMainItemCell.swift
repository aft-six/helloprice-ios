//
//  HomeMainItemCell.swift
//  HelloPrice
//
//  Created by devming on 2020/12/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeMainItemCell: BaseCollectionViewCell<HomeMainItemCellViewModel, HomeMainItemCellViewModel.Output, Product> {
    
    @IBOutlet weak var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.borderWidth = 0.5
            thumbnailImageView.layer.borderColor = UIColor.darkIndigo10.cgColor
            thumbnailImageView.backgroundColor = .white
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var payTypeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var notiButton: UIButton!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    var isRegisteredNoti: Bool = false {
        didSet {
            isRegisteredNoti
                ? notiButton.setImage(UIImage(identifier: .notiOn), for: .normal)
                : notiButton.setImage(UIImage(identifier: .notiOff), for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setContentsSize()
    }
    
    func configure(item: Product) {
        
        titleLabel.text = item.productName
        thumbnailImageView.image = UIImage(identifier: .temp)
//        thumbnailImageView.kf.setImage(with: URL(string: item.imageUrl))
        payTypeLabel.text = item.saleType
        rateLabel.textColor = .red
        rateLabel.setMark(item.priceChangeRate ?? 0, head: "↓", tail: "%")
        priceLabel.setMark(Double(item.price ?? 0), tail: "원")
        dateLabel.text = item.lastUpdateAt
        isRegisteredNoti = item.notifyOn
    }
    
    func setContentsSize() {
        let insets: CGFloat = 40
        let padding: CGFloat = 15
        widthConstraint.constant = (UIScreen.main.bounds.width - insets) / 2 - padding
    }
}

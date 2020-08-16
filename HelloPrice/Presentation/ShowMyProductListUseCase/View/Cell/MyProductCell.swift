//
//  MyProductCell.swift
//  HelloPrice
//
//  Created by devming on 2020/08/15.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MyProductCell: BaseTableViewCell<MyProductCellViewModel, Product> {
    
    @IBOutlet weak var movePositionButton: UIButton!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var paymentMethodLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var lowestPriceLabel: UILabel!
    @IBOutlet weak var lastConfirmTimeLabel: UILabel!
    
    var outputs = MyProductCellViewModel.Output()
    
    override func bindViewModel(item: Product) {
        outputs.thumbnailImageUrlString
            .map { UIImage(named: $0) }
            .bind(to: thumbnailImageView.rx.image)
            .disposed(by: 👜)
        
        outputs.productName
            .bind(to: productNameLabel.rx.text)
            .disposed(by: 👜)
        
        outputs.paymentMethod
            .bind(to: paymentMethodLabel.rx.text)
            .disposed(by: 👜)
        
        outputs.currentPrice
            .map { "\($0)" }
            .bind(to: currentPriceLabel.rx.text)
            .disposed(by: 👜)
        
        outputs.previousPrice
            .map { "\($0)" }
            .bind(to: previousPriceLabel.rx.text)
            .disposed(by: 👜)
        
        outputs.lowestPrice
            .map { "\($0)" }
            .bind(to: lowestPriceLabel.rx.text)
            .disposed(by: 👜)
        
        outputs.lastConfirmTime
            .bind(to: lastConfirmTimeLabel.rx.text)
            .disposed(by: 👜)
    }
    
//    func fetchProduct(product: Product) {
//        let input = MyProductCellViewModel.Input()
//        input.bindData.accept(product)
//
//        outputs = viewModel!.transform(input: input)
//    }
}

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

class MyProductCell: BaseTableViewCell<MyProductCellViewModel, MyProductCellViewModel.Output, Product> {
    
    @IBOutlet weak var movePositionButton: UIButton!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var paymentMethodLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var lowestPriceLabel: UILabel!
    @IBOutlet weak var lastConfirmTimeLabel: UILabel!
    
    override func bindViewModel(outputs: MyProductCellViewModel.Output) {
        if #available(iOS 13.0, *) {
            outputs.thumbnailImageUrlString
                .map { UIImage(systemName: $0) }
                .bind(to: thumbnailImageView.rx.image)
                .disposed(by: 👜)
        } else {
            outputs.thumbnailImageUrlString
                .map { UIImage(named: $0) }
                .bind(to: thumbnailImageView.rx.image)
                .disposed(by: 👜)
        }
        
        outputs.productName
            .do(onNext: {
                print("productName : \($0)")
            })
            .bind(to: productNameLabel.rx.text)
            .disposed(by: 👜)
        
        outputs.paymentMethod
            .do(onNext: {
                print("paymentMethod : \($0)")
            })
            .bind(to: paymentMethodLabel.rx.text)
            .disposed(by: 👜)
        
        outputs.currentPrice
            .map { "\($0)" }
            .do(onNext: {
                print("currentPrice : \($0)")
            })
            .bind(to: currentPriceLabel.rx.text)
            .disposed(by: 👜)
        
        outputs.previousPrice
            .map { "\($0)" }
            .do(onNext: {
                print("previousPrice : \($0)")
            })
            .bind(to: previousPriceLabel.rx.text)
            .disposed(by: 👜)
        
        outputs.lowestPrice
            .map { "\($0)" }
            .do(onNext: {
                print("lowestPrice : \($0)")
            })
            .bind(to: lowestPriceLabel.rx.text)
            .disposed(by: 👜)
        
        outputs.lastConfirmTime
        .do(onNext: {
            print("lastConfirmTime : \($0)")
        })
            .bind(to: lastConfirmTimeLabel.rx.text)
            .disposed(by: 👜)
    }
}

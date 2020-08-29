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
import Kingfisher
import RxKingfisher

class MyProductCell: BaseTableViewCell<MyProductCellViewModel, MyProductCellViewModel.Output, Product>, CellViewModelCreatable {
    
    @IBOutlet weak var movePositionButton: UIButton!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var paymentMethodLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var lowestPriceLabel: UILabel!
    @IBOutlet weak var lastConfirmTimeLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModelCreatable = self
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        viewModelCreatable = self
    }
    
    override func bindViewModel(item: Product) {
        super.bindViewModel(item: item)
        
        let input = MyProductCellViewModel.Input()
        let outputs = viewModel!.transform(input: input)
        
        outputs.thumbnailImageUrlString
            .filter { $0 != "" }
            .map { ImageResource(downloadURL: URL(string: $0)!) }
            .bind(to: thumbnailImageView.kf.rx.image())
            .disposed(by: 👜)
        
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
        
        input.bindData.accept(item)
    }
    
    func createCellViewModel() {
        viewModel = MyProductCellViewModel()
    }
}

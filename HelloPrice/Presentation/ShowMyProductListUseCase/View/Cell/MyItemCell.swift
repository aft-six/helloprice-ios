//
//  MyItemCell.swift
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

class MyItemCell: BaseTableViewCell<MyProductCellViewModel, MyProductCellViewModel.Output, Product>, CellViewModelCreatable {
    
//    @IBOutlet weak var movePositionButton: UIButton! {
//        didSet {
//            self.movePositionButton.isHidden = true
//        }
//    }
    @IBOutlet weak var thumbnailImageView: UIImageView! {
        didSet {
            self.thumbnailImageView.layer.borderWidth = 1.0
            self.thumbnailImageView.layer.borderColor = UIColor.lightGray.cgColor
            self.thumbnailImageView.layer.cornerRadius = 60
        }
    }
    @IBOutlet weak var productNameLabel: UILabel! {
        didSet {
            self.paymentMethodLabel.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var paymentMethodLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
//    @IBOutlet weak var previousPriceLabel: UILabel!
//    @IBOutlet weak var lowestPriceLabel: UILabel!
    @IBOutlet weak var lastConfirmTimeLabel: UILabel!
    @IBOutlet weak var alarmCheckToggle: UISwitch! {
        didSet {
            self.alarmCheckToggle.offImage = UIImage(named: "ic_notification")
            self.alarmCheckToggle.onImage = UIImage(systemName: "pencil")
        }
    }
    
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
            .do(onNext: { [weak self] method in
                self?.paymentMethodLabel.backgroundColor = self?.fillPaymentMethodBackgroundColor(paymentMethod: method)
            })
            .map { [weak self] in self?.convertPaymentMethod(paymentMethod: $0) }
            .bind(to: paymentMethodLabel.rx.text)
            .disposed(by: 👜)
        
        outputs.currentPrice
            .map { "\($0)" }
            .do(onNext: {
                print("currentPrice : \($0)")
            })
            .bind(to: currentPriceLabel.rx.text)
            .disposed(by: 👜)
        
//        outputs.previousPrice
//            .map { "\($0)" }
//            .do(onNext: {
//                print("previousPrice : \($0)")
//            })
//            .bind(to: previousPriceLabel.rx.text)
//            .disposed(by: 👜)
        
//        outputs.lowestPrice
//            .map { "\($0)" }
//            .do(onNext: {
//                print("lowestPrice : \($0)")
//            })
//            .bind(to: lowestPriceLabel.rx.text)
//            .disposed(by: 👜)
        
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

/// Rx binding 할 때 필요한 변환 메소드들.
extension MyItemCell {
    func fillPaymentMethodBackgroundColor(paymentMethod: String) -> UIColor {
        switch paymentMethod.paymentMethod {
        case .cash:
            return UIColor(red: 20, green: 20, blue: 230, alpha: 255)
        case .card:
            return UIColor(red: 20, green: 230, blue: 20, alpha: 255)
        case .normal:
            return UIColor(red: 230, green: 20, blue: 20, alpha: 255)
        case .invalid:
            return UIColor(red: 20, green: 20, blue: 20, alpha: 20)
        }
    }
    
    func convertPaymentMethod(paymentMethod: String) -> String {
        switch paymentMethod.paymentMethod {
        case .cash:
            return "현금가"
        case .card:
            return "카드"
        case .normal:
            return "일반가"
        case .invalid:
            return ""
        }
    }
}

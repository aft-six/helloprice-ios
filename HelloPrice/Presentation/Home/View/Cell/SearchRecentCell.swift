//
//  SearchRecentCell.swift
//  HelloPrice
//
//  Created by devming on 2021/01/03.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchRecentCell: BaseTableViewCell<SearchRecentCellViewModel, SearchRecentCellViewModel.Output, SearchRecentObject> {
    
    @IBOutlet weak var typeImageView: UIImageView! {
        didSet {
            typeImageView.layer.cornerRadius = typeImageView.frame.height / 2.0
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    var url: URL?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        👜 = DisposeBag()
        bindRx()
    }
    
    func bindRx() {
        removeButton.rx.tap
            .asDriver()
            .drive(onNext: {
                print("제거!")
            })
            .disposed(by: 👜)
    }
    
    func fill(_ item: SearchRecentObject) {
        titleLabel.text = item.title
        switch item.searchType {
        case .name:
            typeImageView.image = UIImage(named: "iconSearch")
        case .url:
            typeImageView.image = UIImage(named: "iconUrl")
            if let urlString = item.url, let url = URL(string: urlString) {
                self.url = url
            }
        }
    }
}

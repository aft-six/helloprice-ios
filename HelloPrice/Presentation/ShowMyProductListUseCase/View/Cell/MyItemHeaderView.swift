//
//  MyItemHeaderView .swift
//  HelloPrice
//
//  Created by devming on 2020/10/31.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MyItemHeaderView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sortOptionButton: UIButton!
    
    class func createFromNib() -> MyItemHeaderView {
        return Bundle.main.loadNibNamed(MyItemHeaderView.className, owner: self, options: nil)?.first as! MyItemHeaderView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initView()
    }
    
    func initView() {
        titleLabel.text = "총 0개의 아이템이 있습니다."
    }
    
    var sortButtonTapped: ControlEvent<Void> {
        return sortOptionButton.rx.tap
    }
}

//
//  SearchBottomSheet.swift
//  HelloPrice
//
//  Created by devming on 2021/01/12.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit

class SearchBottomSheet: BottomSheetViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vvv = UIView()
        vvv.backgroundColor = .red
        vvv.tag = 91234
        addBottomSheetMainView(vvv)
    }
}

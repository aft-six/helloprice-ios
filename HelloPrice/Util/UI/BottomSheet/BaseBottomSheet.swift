//
//  BaseBottomSheet.swift
//  ProjectVanilla
//
//  Created by devming on 2021/01/28.
//

import UIKit

protocol BottomSheetViewDelegate: class {
    func layoutAutoSizsing()
}

class BaseBottomSheetView: UIView {
    weak var delegate: BottomSheetViewDelegate?
}

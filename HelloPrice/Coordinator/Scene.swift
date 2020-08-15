//
//  Scene.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

enum Scene {
    case main(MyProductViewModel)
    case myPage(MyPageViewModel)
}

extension Scene {
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .main(let viewModel):
            break
        case .myPage(let viewModel):
            break
        }
        
        return UIViewController ()
    }
}

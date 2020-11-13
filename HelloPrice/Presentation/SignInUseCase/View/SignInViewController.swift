//
//  SignInViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/08/27.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SignInViewController: BaseViewController<SignInViewModel> {
    
    @IBOutlet weak var kakaoSignInButton: UIButton!
    @IBOutlet weak var googleSignInButton: UIButton!
    @IBOutlet weak var appleSignInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        kakaoSignInButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                print("Kakao!")
                let nextStoryboard = UIStoryboard(name: "ShowMyProductList", bundle: nil)
                if let nextViewController = nextStoryboard.instantiateViewController(withIdentifier: MyProductListViewController.className) as? MyProductListViewController {
                    self?.present(nextViewController, animated: true)
                }
                
            }).disposed(by: 👜)
        googleSignInButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                print("Google!")
                let nextStoryboard = UIStoryboard(name: "ShowMyProductList", bundle: nil)
                if let nextViewController = nextStoryboard.instantiateViewController(withIdentifier: MyProductListViewController.className) as? MyProductListViewController {
                    self?.present(nextViewController, animated: true)
                }
                
            }).disposed(by: 👜)
    }
}

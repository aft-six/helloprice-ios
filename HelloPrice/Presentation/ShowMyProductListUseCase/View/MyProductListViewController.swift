//
//  MyProductListViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/06/03.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MyProductListViewController: BaseViewController<MyProductViewModel> {
    
    @IBOutlet weak var myProductListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    override func bindViewModel() {
        let fetchDatas = PublishRelay<Void>()
        let presentWebsite = PublishRelay<Void>()
        
        let inputs = MyProductViewModel
                        .Input(fetchDatas: fetchDatas,
                               presentWebsite: presentWebsite)
        /// - TODO
        /// accept로 불러오기를 call하는 중인데, 이걸 viewController가 viewDidLoad를 호출한 뒤로 엮으면 더 좋을듯!
        inputs.fetchDatas.accept(())

        let outputs = viewModel!.transform(inputs: inputs)
        /// - TODO
        /// RxDatasource에 대해 알아보자.
        outputs.productsCount
            .asDriver(onErrorJustReturn: 0)
            .drive(onNext: { count in
                print("count: \(count)")
            })
            .disposed(by: 👜)
        
        outputs.products
            .asDriver(onErrorJustReturn: [Product]())
            .drive(onNext: { products in
                print("-- product list --")
                products.forEach { product in
                    print("product: \(product)")
                }
            })
            .disposed(by: 👜)
    }
}



//let config = WKWebViewConfiguration()
//let contentController = WKUserContentController()
//
//let userScript = WKUserScript(source: "redHeader()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
//contentController.addUserScript(userScript)
//
//config.userContentController = contentController

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
    let fetchDatas = PublishRelay<Void>()
    let presentWebsite = PublishRelay<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func bindViewModel() {
        
        let inputs = MyProductViewModel
                        .Input(fetchDatas: fetchDatas,
                               presentWebsite: presentWebsite)

        let outputs = viewModel!.transform(inputs: inputs)
        
        makeTableView()
        
        outputs.products
            .bind(to: myProductListTableView.rx.items(cellIdentifier: MyProductCell.className)) { index, product, cell in
                guard let productCell = cell as? MyProductCell else { return }
                
                productCell.bindViewModel(item: product)
            }
            .disposed(by: 👜)
        
        loadDatas()
    }
    
    func loadDatas() {
        /// - TODO
        /// accept로 불러오기를 call하는 중인데, 이걸 viewController가 viewWillAppear를 호출한 뒤로 엮으면 더 좋을듯!
        fetchDatas.accept(())
        
    }
    
    func makeTableView() {
        let nibName = UINib(nibName: MyProductCell.className, bundle: nil)
        myProductListTableView.register(nibName, forCellReuseIdentifier: MyProductCell.className)
        myProductListTableView.rowHeight = 200
//        myProductListTableView.estimatedRowHeight = 200
    }
}



//let config = WKWebViewConfiguration()
//let contentController = WKUserContentController()
//
//let userScript = WKUserScript(source: "redHeader()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
//contentController.addUserScript(userScript)
//
//config.userContentController = contentController

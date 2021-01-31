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

class MyProductListViewController: BaseViewController<MyProductReactor> {
    
    weak var coordinatorDelegate: MyProductCoordinating?
    @IBOutlet weak var myProductListTableView: UITableView! {
        didSet {
            let nibName = UINib(nibName: MyItemCell.className, bundle: nil)
            myProductListTableView.register(nibName, forCellReuseIdentifier: MyItemCell.className)
            myProductListTableView.rowHeight = 200
            let tableViewHeader = MyItemHeaderView.createFromNib()
            myProductListTableView.tableHeaderView = tableViewHeader
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func bind(reactor: MyProductReactor) {
        Observable.just(())
            .map { Reactor.Action.fetchDatas }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
}

//let config = WKWebViewConfiguration()
//let contentController = WKUserContentController()
//
//let userScript = WKUserScript(source: "redHeader()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
//contentController.addUserScript(userScript)
//
//config.userContentController = contentController

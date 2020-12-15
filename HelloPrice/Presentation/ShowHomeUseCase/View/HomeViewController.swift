//
//  HomeViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import NSObject_Rx

class HomeViewController: BaseViewController<HomeViewModel> {
    
    @IBOutlet weak var searchBackgroundView: UIView! {
        didSet {
            searchBackgroundView.layer.shadowColor = UIColor.black.cgColor
            searchBackgroundView.layer.shadowOpacity = 0.4
        }
    }
    @IBOutlet weak var categoryCollectionView: UICollectionView! {
        didSet {
            categoryCollectionView.register(HomeCellType.category.nib, forCellWithReuseIdentifier: HomeCellType.category.identifier)
//            categoryCollectionView.dataSource = self
            categoryCollectionView.delegate = self
            
        }
    }
    @IBOutlet weak var mainItemCollectionView: UICollectionView! {
        didSet {
            mainItemCollectionView.register(HomeCellType.main.nib, forCellWithReuseIdentifier: HomeCellType.main.identifier)
            
//            mainItemCollectionView.dataSource = self
            mainItemCollectionView.delegate = self
        }
    }
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainCollectionTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var categoryHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var categoryTopHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchField: UITextField! {
        didSet {
            
            searchField.rx.controlEvent(.editingDidEndOnExit)
                .asDriver()
                .drive(onNext: { [weak self] in
                    self?.resignFirstResponder()
                })
                .disposed(by: rx.disposeBag)
            searchField.rx.controlEvent(.editingDidBegin)
                .asDriver()
                .drive(onNext: {
                    
                    let pasteBoard = UIPasteboard.general
                    if pasteBoard.hasURLs {
                        // 복사한 URL 넣기 버튼 추가
                        print("\(pasteBoard.url)")
                    }
                    
                })
                .disposed(by: rx.disposeBag)
        }
    }
    
    lazy var categoryDataSource: RxCollectionViewSectionedReloadDataSource<SectionOfDomainObject<HomeCategory>> = {
        let categoryDataSource = RxCollectionViewSectionedReloadDataSource<SectionOfDomainObject<HomeCategory>> { dataSource, collectionView, indexPath, item -> HomeCategoryItemCell in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryItemCell.identifier, for: indexPath) as? HomeCategoryItemCell else { return HomeCategoryItemCell() }
            cell.configure(item: item)
            return cell
        }
        return categoryDataSource
    }()
    lazy var mainItemDataSource: RxCollectionViewSectionedReloadDataSource<SectionOfDomainObject<Product>> = {
        let mainItemDataSource = RxCollectionViewSectionedReloadDataSource<SectionOfDomainObject<Product>> { dataSource, collectionView, indexPath, item -> HomeMainItemCell in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMainItemCell.identifier, for: indexPath) as? HomeMainItemCell else { return HomeMainItemCell() }
            cell.configure(item: item)
            return cell
        }
        return mainItemDataSource
    }()
    
    let fetchCategories = PublishRelay<Void>()
    let fetchCategoryItems = PublishRelay<Int>()
    let presentWebsite = PublishRelay<Void>()
    var inputs: HomeViewModel.Input?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        inputs?.fetchCategories.accept(())
        inputs?.fetchCategoryItems.accept(0)
        categoryCollectionView.reloadData()
        mainItemCollectionView.reloadData()
        categoryCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
    }
    
    override func bindViewModel() {
        print(#function)
        inputs = HomeViewModel.Input(fetchCategories: fetchCategories, fetchCategoryItems: fetchCategoryItems)
        
        let outputs = viewModel.transform(input: inputs!)
        
        outputs.categories
            .subscribeOn(MainScheduler.asyncInstance)
            .bind(to: categoryCollectionView.rx.items(dataSource: categoryDataSource))
            .disposed(by: 👜)
        
        outputs.products
            .subscribeOn(MainScheduler.asyncInstance)
            .bind(to: mainItemCollectionView.rx.items(dataSource: mainItemDataSource))
            .disposed(by: 👜)
        
        categoryDataSource.collectionView(categoryCollectionView, observedEvent: .completed)
        mainItemDataSource.collectionView(mainItemCollectionView, observedEvent: .completed)
    }
    
    func setNavigationController() {
        let defaultHeight: CGFloat = 131
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .richBlue
        titleViewHeightConstraint.constant = defaultHeight + topSafeAreaHeight
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            return
        }
        
        topConstraint.constant = -scrollView.contentOffset.y
    }
}
//
//extension HomeViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch collectionView {
//        case categoryCollectionView:
//            return categories.count
//        case mainItemCollectionView:
//            return items.count
//        default:
//            return 0
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch collectionView {
//        case categoryCollectionView:
//            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryItemCell.identifier, for: indexPath) as? HomeCategoryItemCell {
//                cell.configure(item: categories[indexPath.item])
//                return cell
//            }
//        case mainItemCollectionView:
//            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMainItemCell.identifier, for: indexPath) as? HomeMainItemCell {
//                cell.configure(item: items[indexPath.item])
//                return cell
//            }
//        default:
//            #if DEBUG
//            fatalError("Cell Creation Error")
//            #else
//            return UICollectionViewCell()
//            #endif
//        }
//        #if DEBUG
//        fatalError("Cell Creation Error")
//        #else
//        return UICollectionViewCell()
//        #endif
//    }
//
//
//}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if collectionView === mainItemCollectionView {
            let topMargin = categoryHeightConstraint.constant
                + categoryTopHeightConstraint.constant
                + titleViewHeightConstraint.constant
            
            return CGSize(width: collectionView.frame.width, height: topMargin)
        }
        
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView === categoryCollectionView {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
}

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
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 8
            layout.estimatedItemSize = CGSize(width: 90, height: 48)
            layout.itemSize = UICollectionViewFlowLayout.automaticSize
            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            categoryCollectionView.collectionViewLayout = layout
        }
    }
    @IBOutlet weak var mainItemCollectionView: UICollectionView! {
        didSet {
            mainItemCollectionView.register(UINib(nibName: HeaderMarginView.className, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderMarginView.className)
            mainItemCollectionView.register(HomeCellType.main.nib, forCellWithReuseIdentifier: HomeCellType.main.identifier)
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 8
            layout.estimatedItemSize = CGSize(width: 160, height: 300)
            layout.itemSize = UICollectionViewFlowLayout.automaticSize
            layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            mainItemCollectionView.collectionViewLayout = layout
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
                    if pasteBoard.hasURLs, let url = pasteBoard.url {
                        // 복사한 URL 넣기 버튼 추가
                        print("\(url)")
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
        let mainItemDataSource = RxCollectionViewSectionedReloadDataSource<SectionOfDomainObject<Product>>(configureCell: { dataSource, collectionView, indexPath, item -> HomeMainItemCell in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMainItemCell.identifier, for: indexPath) as? HomeMainItemCell else { return HomeMainItemCell() }
            cell.configure(item: item)
            return cell
        }, configureSupplementaryView: { [weak self] dataSource, collectionView, titleString, indexPath -> UICollectionReusableView in
            guard let `self` = self,
                  let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderMarginView.className, for: indexPath) as? HeaderMarginView else {
                return UICollectionReusableView()
            }
            self.categoryCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
            self.categoryCollectionView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            
            return header
        })
        
        return mainItemDataSource
    }()
    
    let fetchCategories = PublishRelay<Void>()
    let fetchCategoryItems = PublishRelay<Int>()
    let presentWebsite = PublishRelay<Void>()
    var inputs: HomeViewModel.Input?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let topMargin = self.categoryHeightConstraint.constant
            + self.categoryTopHeightConstraint.constant
            + self.titleViewHeightConstraint.constant
        let layout = mainItemCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.headerReferenceSize = CGSize(width: mainItemCollectionView.frame.width, height: topMargin)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        inputs?.fetchCategories.accept(())
        inputs?.fetchCategoryItems.accept(0)
        categoryCollectionView.reloadData()
        mainItemCollectionView.reloadData()
    }
    
    override func bindViewModel() {
        print(#function)
        inputs = HomeViewModel.Input(fetchCategories: fetchCategories, fetchCategoryItems: fetchCategoryItems)
        
        let outputs = viewModel.transform(input: inputs!)
        
        outputs.categories
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: categoryCollectionView.rx.items(dataSource: categoryDataSource))
            .disposed(by: 👜)
        
        outputs.products
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: mainItemCollectionView.rx.items(dataSource: mainItemDataSource))
            .disposed(by: 👜)
        
        mainItemCollectionView.rx.didScroll
            .observeOn(MainScheduler.asyncInstance)
            .map { [weak self] () -> CGFloat in
                guard let `self` = self else { return 0 }
                return self.mainItemCollectionView.contentOffset.y
            }
            .asDriver(onErrorJustReturn: 0)
            .drive(onNext: { [weak self] y in
                guard let `self` = self else { return }
                if y < 0 {
                    self.mainItemCollectionView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
                    return
                }
                
                self.topConstraint.constant = -y
            })
            .disposed(by: 👜)
    }
}

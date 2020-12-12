//
//  HomeViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit
class HomeViewController: BaseViewController<HomeViewModel> {
    
    @IBOutlet weak var searchBackgroundView: UIView! {
        didSet {
            searchBackgroundView.layer.shadowColor = UIColor.black.cgColor
            searchBackgroundView.layer.shadowOpacity = 0.4
        }
    }
    @IBOutlet weak var titleBackHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleViewHeightConstraint: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView! {
        didSet {
            categoryCollectionView.register(HomeCellType.category.nib, forCellWithReuseIdentifier: HomeCellType.category.identifier)
            categoryCollectionView.dataSource = self
            categoryCollectionView.delegate = self
        }
    }
    @IBOutlet weak var mainItemCollectionView: UICollectionView! {
        didSet {
//            mainItemCollectionView.register(UINib(nibName: HomeMainItemCell.className, bundle: Bundle.main), forCellWithReuseIdentifier: HomeMainItemCell.className)
            mainItemCollectionView.register(HomeCellType.main.nib, forCellWithReuseIdentifier: HomeCellType.main.identifier)
            mainItemCollectionView.dataSource = self
            mainItemCollectionView.delegate = self
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .vertical
//            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//            layout.itemSize = CGSize(width: mainItemCollectionView.frame.width / 2 - 15, height: mainItemCollectionView.contentSize.height)
//            layout.minimumInteritemSpacing = 15
//            layout.minimumLineSpacing = 20
        }
    }
    
    var categories = [HomeCategory(title: "전체"),
                 HomeCategory(title: "가전제품"),
                 HomeCategory(title: "식품"),
                 HomeCategory(title: "화장품")]
    
    var items = [Product(id: 0, productName: "애플 에어팟 프로", productCode: "1010", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 30300, prevPrice: 34000, additionalInfo: "추가 정보", priceChangeRate: 12.3, lowestPrice: 29400, lastUpdateAt: "20-12-12", notifyOn: true), Product(id: 1, productName: "삼성 노트북 시리즈9", productCode: "1011", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 800300, prevPrice: 830000, additionalInfo: "추가 정보", priceChangeRate: 6.3, lowestPrice: 800300, lastUpdateAt: "20-12-10", notifyOn: false), Product(id: 1, productName: "삼성 노트북 시리즈9", productCode: "1011", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 800300, prevPrice: 830000, additionalInfo: "추가 정보", priceChangeRate: 6.3, lowestPrice: 800300, lastUpdateAt: "20-12-10", notifyOn: false), Product(id: 1, productName: "삼성 노트북 시리즈9", productCode: "1011", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 800300, prevPrice: 830000, additionalInfo: "추가 정보", priceChangeRate: 6.3, lowestPrice: 800300, lastUpdateAt: "20-12-10", notifyOn: false), Product(id: 1, productName: "삼성 노트북 시리즈9", productCode: "1011", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 800300, prevPrice: 830000, additionalInfo: "추가 정보", priceChangeRate: 6.3, lowestPrice: 800300, lastUpdateAt: "20-12-10", notifyOn: false), Product(id: 1, productName: "삼성 노트북 시리즈9", productCode: "1011", url: "https://", imageUrl: "url", description: "", saleStatus: "", saleType: "카드가", price: 800300, prevPrice: 830000, additionalInfo: "추가 정보", priceChangeRate: 6.3, lowestPrice: 800300, lastUpdateAt: "20-12-10", notifyOn: false)
                 ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
//        setNavigationController()
        print("이건데?")
//        let titleView = UIView()
//        titleView.backgroundColor = .red
//        titleView.frame = navigationController?.navigationBar.frame ?? CGRect.zero
//        self.navigationItem.titleView = titleView
    }
    
    func setNavigationController() {
        let defaultHeight: CGFloat = 131
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .richBlue
        titleBackHeightConstraint.constant = defaultHeight + topSafeAreaHeight
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        navigationController?.isNavigationBarHidden =   scrollView.contentOffset.y <= 0
//        print("\(scrollView.contentOffset.y)")
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case mainItemCollectionView:
            return items.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryItemCell.identifier, for: indexPath) as? HomeCategoryItemCell {
                cell.configure(item: categories[indexPath.item])
                return cell
            }
        case mainItemCollectionView:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMainItemCell.identifier, for: indexPath) as? HomeMainItemCell {
                cell.configure(item: items[indexPath.item])
                return cell
            }
        default:
            #if DEBUG
            fatalError("Cell Creation Error")
            #else
            return UICollectionViewCell()
            #endif
        }
        #if DEBUG
        fatalError("Cell Creation Error")
        #else
        return UICollectionViewCell()
        #endif
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView === categoryCollectionView {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        if collectionView === categoryCollectionView {
//            return 0
//        }
//        return 20
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        if collectionView === categoryCollectionView {
//            return 8
//        }
//        return 15
//    }
}

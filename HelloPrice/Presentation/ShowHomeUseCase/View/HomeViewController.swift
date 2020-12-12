//
//  HomeViewController.swift
//  HelloPrice
//
//  Created by devming on 2020/11/13.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    @IBOutlet weak var titleBackHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleViewHeightConstraint: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView! {
        didSet {
            categoryCollectionView.register(UINib(nibName: HomeCategoryItemCell.className, bundle: nil), forCellWithReuseIdentifier: HomeCategoryItemCell.identifier)
            categoryCollectionView.dataSource = self
            categoryCollectionView.delegate = self
        }
    }
    
    var items = [HomeCategory(title: "전체"),
                 HomeCategory(title: "가전제품"),
                 HomeCategory(title: "식품"),
                 HomeCategory(title: "화장품")]
    
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
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryItemCell.identifier, for: indexPath) as? HomeCategoryItemCell else {
            return UICollectionViewCell()
        }
        cell.configure(category: items[indexPath.item])
        print("cellwidth: \(cell.categoryLabel.textWidth())")
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

//
//  SearchFilterBottomSheet.swift
//  HelloPrice
//
//  Created by devming on 2021/01/12.
//  Copyright © 2021 besteyes. All rights reserved.
//

import UIKit

class SearchFilterBottomSheet: ScrollableBottomSheetViewController {
    var list = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: SearchFilterBottomSheetCell.className, bundle: nil), forCellWithReuseIdentifier: SearchFilterBottomSheetCell.className)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .base100
    }
    
    
}

extension SearchFilterBottomSheet: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchFilterBottomSheetCell.className, for: indexPath)
        
        if let cell = cell as? SearchFilterBottomSheetCell {
            cell.label.text = list[indexPath.item]
            return cell
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 10, height: 50)
    }
}

extension SearchFilterBottomSheet {
    convenience init(list: [String]) {
        self.init()

        self.list = list
    }
}

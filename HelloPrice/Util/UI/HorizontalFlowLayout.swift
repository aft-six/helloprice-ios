//
//  HorizontalFlowLayout.swift
//  HelloPrice
//
//  Created by devming on 2020/12/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

protocol HorizontalFlowLayoutDelegate: class {
    func collectionView(_ collectionView: UICollectionView, widthForLabelAtIndexPath indexPath: IndexPath) -> CGFloat
}

class HorizontalFlowLayout: UICollectionViewFlowLayout {
    
    // delegate 사용
    weak var delegate: HorizontalFlowLayoutDelegate?
    // 레이아웃을 구성하기 위한 속성들
    private var numberOfLines = 1
    private var cellPaddingX: CGFloat = 8
    private var cellPaddingY: CGFloat = 10
    // 연산된 속성을 캐싱하는 배열. prepare() 메소드를 호출할 때, 모든 아이템에 대한 속성을 연산하고 캐시에 이 값들을 추가한다. collection view가 나중에 레이아웃 속성을 요청할 때, 매번 계산하는게 아니라 효율적으로 가져올 수 있다.
    private var layoutCache = [UICollectionViewLayoutAttributes]()
    // content size를 저장하기 위해 선언한 두개의 속성. contentWidth는 아이템이 추가되는 것으로 증가하고, contentHeight는 collection view의 높이와 설정된 inset으로 연산된다.
    private var contentWidth: CGFloat = 0
    private var contentHeight: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let insets = collectionView.contentInset
        return collectionView.bounds.height - (insets.top + insets.bottom)
    }
    // collection viwe의 컨텐츠 사이즈를 반환하는 속성이다.
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        super.prepare()
        
        guard layoutCache.isEmpty, let collectionView = collectionView else { return }
        
        let insets = collectionView.contentInset
        var yOffset: CGFloat
        if numberOfLines == 0 {
            print("무한!")
            yOffset = 0
        } else if numberOfLines == 1 {
            yOffset = insets.top
        } else {
            yOffset = contentHeight / CGFloat(numberOfLines)
        }
        var column = 0
        var xOffset: CGFloat = insets.left
        
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let width = delegate?.collectionView(collectionView, widthForLabelAtIndexPath: indexPath) ?? 100
            let frame = CGRect(x: xOffset, y: yOffset, width: width, height: contentHeight)
            let insetFrame = frame.insetBy(dx: cellPaddingX, dy: cellPaddingY)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            layoutCache.append(attributes)
            
            contentWidth = max(contentWidth, frame.maxX)
            xOffset = xOffset + contentWidth
            
            column = column < (numberOfLines - 1) ? (column + 1) : 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in layoutCache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutCache[indexPath.item]
    }
}

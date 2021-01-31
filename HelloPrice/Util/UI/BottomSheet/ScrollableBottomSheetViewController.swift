//
//  ScrollableBottomSheetViewController.swift
//  ProjectVanilla
//
//  Created by devming on 2021/01/12.
//

import UIKit

class ScrollableBottomSheetViewController: BottomSheetViewController {
    var collectionView: UICollectionView
    override var gesture: UIPanGestureRecognizer {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        gesture.delegate = self
        return gesture
    }
    
    required init?(coder: NSCoder) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)

        super.init(coder: coder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBottomSheetMainView(collectionView)
    }
}

extension ScrollableBottomSheetViewController: UIGestureRecognizerDelegate {

    // Solution
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let gesture = (gestureRecognizer as! UIPanGestureRecognizer)
        let direction = gesture.velocity(in: view).y

        let y = view.frame.minY
        if y == topMargin && collectionView.contentOffset.y == 0 && direction > 0 {
            collectionView.isScrollEnabled = false
        } else {
            collectionView.isScrollEnabled = true
        }
        
        return false
    }
}

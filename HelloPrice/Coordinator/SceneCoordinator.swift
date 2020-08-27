//
//  SceneCoordinator.swift
//  HelloPrice
//
//  Created by devming on 2020/06/04.
//  Copyright © 2020 besteyes. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum StoryboardName: String {
    case RootTabBarController
    case ShowMyProductList
    case ShowMyPage
    case SignIn
    case SignUp
}

extension UIViewController {
    var sceneViewController: UIViewController {
        return self.children.first ?? self
    }
}

class SceneCoordinator: SceneCoordinatorType {
    private var bag = DisposeBag()
    private var window: UIWindow
    private var currentVC: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        self.currentVC = window.rootViewController!
    }
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
        let subject = PublishSubject<Void>()
        let target = scene.instantiate()
        
        switch style {
        case .root:
            currentVC = target.sceneViewController
            window.rootViewController = target
            subject.onCompleted()
        case .push:
            guard let nav = currentVC.navigationController else {
                subject.onError(TransitionError.navigationControllerMissing)
                break
            }
            
            nav.rx.willShow
                .subscribe(onNext: { evt in
                    self.currentVC = evt.viewController.sceneViewController
                })
                .disposed(by: bag)
            let navigationController = UINavigationController()
            navigationController.pushViewController(currentVC, animated: animated)
            subject.onCompleted()
        case .modal:
            currentVC.present(target, animated: animated) {
                subject.onCompleted()
            }
            currentVC = target.sceneViewController
        }
        
        return subject.ignoreElements()
    }
    
    @discardableResult
    func close(animated: Bool) -> Completable {
        return Completable.create { _ in
            return Disposables.create { }
        }
//        return Completable.create { [unowned self] completable in
//
//            if let presentingVC = self.currentVC.presentingViewController {
//                self.currentVC.dismiss(animated: animated) {
//                    self.currentVC = presentingVC.sceneViewController
//                    completable(.completed)
//                }
//                self.currentVC = presentingVC.sceneViewController
//
//            } else if let nav = self.currentVC.navigationController {
//                guard nav.popViewController(animated: animated) != nil else {
////                    completable(.error(TransitionError.cannotPop)) {
////                        return Disposables
//                    }
//                }
//            } else {
////                completable(.error(TransitionError))
//            }
//            return Disposables.create()
//        }
    }
    
    
}

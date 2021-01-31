//
//  BottomSheetViewController.swift
//  ProjectVanilla
//
//  Created by devming on 2021/01/12.
//

import UIKit

class BottomSheetViewController: UIViewController {
    private var mainView: UIView
    private var headerView: UIView
    var topMargin: CGFloat = 100
    var partialView: CGFloat {
        return UIScreen.main.bounds.height
    }
    var thresholdVelocity: CGFloat = 250
    var threshold: CGFloat {
        return view.frame.height / 3
    }
    var gesture: UIPanGestureRecognizer {
        return UIPanGestureRecognizer(target: self, action: #selector(BottomSheetViewController.panGesture))
    }
    
    required init?(coder: NSCoder) {
        headerView = UIView(frame: CGRect.zero)
        mainView = UIView(frame: CGRect.zero)

        super.init(coder: coder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        headerView = UIView(frame: CGRect.zero)
        mainView = UIView(frame: CGRect.zero)

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
    }
    
    func setViews() {
        // background view
        view.cornerRadius = 12
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.addGestureRecognizer(gesture)
        // header view
        headerView.backgroundColor = .white
        headerView.cornerRadius = 12
        headerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 35),
            view.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
        ])
        // header view holder
        let holder = UIView()
        holder.cornerRadius = 2.5
        holder.backgroundColor = .base10
        headerView.addSubview(holder)
        holder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.centerXAnchor.constraint(equalTo: holder.centerXAnchor),
            headerView.centerYAnchor.constraint(equalTo: holder.centerYAnchor),
            holder.widthAnchor.constraint(equalToConstant: 60),
            holder.heightAnchor.constraint(equalToConstant: 5)
        ])
        // main view
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.bottomAnchor.constraint(equalTo: mainView.topAnchor),
            view.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        ])
        // add gesture dimmed dismiss
        let dismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissGesture))
        
        parent?.view
            .subviews
            .filter { $0 is DimmedView }
            .first?
            .addGestureRecognizer(dismissTapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6, animations: {
            let frame = self.view.frame
            let yComponent = self.topMargin
            self.view.frame = CGRect(x: 0, y: yComponent, width: frame.width, height: frame.height - self.topMargin)
        })
    }
    
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: view)
        let velocity = recognizer.velocity(in: view)
        let y = view.frame.minY
        
        if (y + translation.y >= topMargin) && (y + translation.y <= partialView ) {
            view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
            recognizer.setTranslation(CGPoint.zero, in: view)
        }
        
        if recognizer.state == .ended {
            dismiss(velocity: velocity, y: y)
        }
    }

    func addBottomSheetMainView(_ bottomSheetView: UIView) {
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(bottomSheetView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: bottomSheetView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomSheetView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor)
        ])
    }
    
    func dismiss(velocity: CGPoint = CGPoint(x: 0, y: 250), y: CGFloat = 1000, completion: (() -> Void)? = nil) {
        var duration = velocity.y < 0
            ? Double((y - topMargin) / -velocity.y)
            : Double((topMargin - y) / velocity.y )
        
        duration = duration > 1.3 ? 1 : duration
        
        UIView.animate(withDuration: duration, delay: 0.0, options: [.allowUserInteraction]) {
            if velocity.y >= self.thresholdVelocity && self.threshold < y { // 종료
                self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: self.view.frame.width, height: self.view.frame.height)
            } else {    // 살리기(원상 복구)
                self.view.frame = CGRect(x: 0, y: self.topMargin, width: self.view.frame.width, height: self.view.frame.height)
            }
        } completion: { _ in
            if velocity.y >= self.thresholdVelocity && self.threshold < y {
                self.view.removeFromSuperview()
                self.parent?.view.subviews.filter { $0 is DimmedView }.first?.removeFromSuperview()
                completion?()
            }
        }
    }
    
    
    @objc func dismissGesture(_ gesture: UITapGestureRecognizer) {
        dismiss()
    }
    
    func transiteView(from source: UIView, to target: UIView, targetMargin topMargin: CGFloat) {
        self.topMargin = topMargin
        UIView.animate(withDuration: 0.05, animations: {
            source.alpha = 0.0
        }, completion: { _ in
            source.removeFromSuperview()
            self.addBottomSheetMainView(target)
            target.alpha = 0.0
            UIView.animate(withDuration: 0.2, animations: {
                target.alpha = 1.0
                let frame = self.view.frame
                let yComponent = self.topMargin
                self.view.frame = CGRect(x: 0, y: yComponent, width: frame.width, height: UIScreen.main.bounds.height - self.topMargin)
            })
        })
    }
    
    func setAutoTopMargin(target targetView: BaseBottomSheetView) {
        topMargin = UIScreen.main.bounds.height - (targetView.frame.height)
        let frame = view.frame
        let yComponent = topMargin
        view.frame = CGRect(x: 0, y: yComponent, width: frame.width, height: frame.height - topMargin)
        view.layoutIfNeeded()
    }
}

extension BottomSheetViewController {
    convenience init(value topMargin: CGFloat) {
        self.init()
        self.topMargin = topMargin
    }
}

// bottom sheet에 관련된 UIViewController extension이어서 따로 여기로 가져옴.
extension UIViewController {
    func addBottomSheetViewController(viewController bottomSheetViewController: BottomSheetViewController) {

        let dimmedView = DimmedView()
        view.addSubview(dimmedView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: dimmedView.topAnchor),
            view.bottomAnchor.constraint(equalTo: dimmedView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: dimmedView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: dimmedView.trailingAnchor)
        ])

        let bottomSheetViewController = bottomSheetViewController
        if !children.contains(bottomSheetViewController) {
            addChild(bottomSheetViewController)
        }
        view.addSubview(bottomSheetViewController.view)
        bottomSheetViewController.didMove(toParent: self)

        let height = view.frame.height
        let width  = view.frame.width
        bottomSheetViewController.view.frame = CGRect(x: 0, y: view.frame.maxY, width: width, height: height)

        UIView.animate(withDuration: 0.3) {
            dimmedView.alpha = 1.0
        }
    }
}

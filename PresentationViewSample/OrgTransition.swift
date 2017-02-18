//
//  OrgTransition.swift
//  PresentationViewSample
//
//  Created by hirauchi.shinichi on 2017/02/18.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class OrgTransition: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning{
    
    fileprivate var isPresent = false
    
    // MARK: - UIViewControllerTransitioningDelegate
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // 遷移時にTrasitionを担当する（UIViewControllerAnimatedTransitioningプロトコルを実装した）クラスを返す
        isPresent = true
        return self
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // 復帰時にTrasitionを担当する（UIViewControllerAnimatedTransitioningプロトコルを実装した）クラスを返す
        isPresent = false
        return self
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.7
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            animatePresentTransition(transitionContext: transitionContext)
        } else {
            animateDissmissalTransition(transitionContext: transitionContext)
        }
    }
    
    // 遷移時のTrastion処理
    func animatePresentTransition(transitionContext: UIViewControllerContextTransitioning) {
        let from: UIViewController! = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let to: UIViewController! = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView: UIView! = transitionContext.containerView
        containerView.insertSubview(to.view, belowSubview: from.view)
        
        to.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        let visualEffectView = UIVisualEffectView(frame: to.view.frame)
        visualEffectView.effect = UIBlurEffect(style: .regular)
        to.view.insertSubview(visualEffectView, at: 0)

        visualEffectView.alpha = 0.0

        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            visualEffectView.alpha = 1.0
        }, completion: {
            finished in
            transitionContext.completeTransition(true)
        })
    }
    
    // 復帰時のTrastion処理
    func animateDissmissalTransition(transitionContext: UIViewControllerContextTransitioning) {
        let from: UIViewController! = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            from.view.alpha = 0.0
        }, completion: {
            finished in
            transitionContext.completeTransition(true)
        })
    }
    
}

//
//  CustomTransition.swift
//  CustomTransition
//
//  Created by Артём Устинов on 19.07.2021.
//

import UIKit

final class CustomTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    //MARK: - Private properties:
    private let animationDuration: TimeInterval = 1.0
    
    //MARK: - UIViewControllerAnimatedTransitioning:
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        let containerView = transitionContext.containerView
        
        containerView.addSubview(toVC.view)
        
        animateWithAlpha(fromVC: fromVC, toVC: toVC) {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    //MARK: - Private methods:
    private func animateWithAlpha(fromVC: UIViewController,
                                  toVC: UIViewController,
                                  completion: @escaping () -> Void) {
        toVC.view.alpha = 0
        
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0.0, options: .allowUserInteraction, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: self.animationDuration / 2) {
                fromVC.view.alpha = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: self.animationDuration / 2,
                               relativeDuration: self.animationDuration / 2) {
                toVC.view.alpha = 1
            }
            
        }, completion: { _ in
            fromVC.view.alpha = 1
            completion()
        })
    }
    
}

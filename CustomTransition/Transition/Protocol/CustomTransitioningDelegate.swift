//
//  CustomTransitioningDelegate.swift
//  CustomTransition
//
//  Created by Артём Устинов on 19.07.2021.
//

import UIKit

// Here is custom implementation 'UIViewControllerTransitioningDelegate'
final class CustomTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    //MARK: - Properties:
    var isInteractive: Bool = true
    
    //Here is class 'UIPercentDrivenInteractiveTransition' - that helps us with custom swipe to back
    let interactiveTransition = UIPercentDrivenInteractiveTransition()
    
    //MARK: - UIViewControllerTransitioningDelegate:
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return isInteractive ? interactiveTransition : nil
    }
    
}

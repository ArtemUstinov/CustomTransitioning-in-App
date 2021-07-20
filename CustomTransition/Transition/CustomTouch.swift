//
//  CustomTouch.swift
//  CustomTransition
//
//  Created by Артём Устинов on 19.07.2021.
//

import UIKit

protocol CustomTouchDelegate: class {
    func dismissViewController()
}

final class CustomTouch: UIResponder {
    
    weak var delegate: CustomTouchDelegate?

    //MARK: - Private properties:
    private var startingPoing: CGPoint = .zero
    
    private let customTransitioningDelegate: CustomTransitioningDelegate
    private let view: UIView
    
    //MARK: - Initializers:
    init(customTransitioningDelegate: CustomTransitioningDelegate, view: UIView) {
        self.customTransitioningDelegate = customTransitioningDelegate
        self.view = view
    }
    
    //MARK: - UIResponder:
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        customTransitioningDelegate.isInteractive = true
        guard let touch = touches.first else { return }
        let point = touch.preciseLocation(in: view)
        startingPoing = point
    }
    
    override func touchesMoved(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let point = touch.preciseLocation(in: view)
        let progress = (point.x - startingPoing.x) / view.frame.width
        customTransitioningDelegate.interactiveTransition.update(progress)
        delegate?.dismissViewController()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let point = touch.preciseLocation(in: view)
        let previousPoint = touch.precisePreviousLocation(in: view)
        let isFinish = point.x >= previousPoint.x
        
        if isFinish {
            customTransitioningDelegate.interactiveTransition.finish()
        } else {
            customTransitioningDelegate.interactiveTransition.cancel()
            customTransitioningDelegate.isInteractive = true
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>,
                                   with event: UIEvent?) {
        customTransitioningDelegate.interactiveTransition.cancel()
    }
    
}

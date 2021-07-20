//
//  SecondViewController.swift
//  CustomTransition
//
//  Created by Артём Устинов on 19.07.2021.
//

import UIKit

final class SecondViewController: UIViewController {
    
    //MARK: - Transiotion property
    //Here is transition property for custom transition
    var customTransitioningDelegate = CustomTransitioningDelegate()
    
    private var customTouch: CustomTouch?
    
    override func viewDidLoad() {
        customTouch = CustomTouch(
            customTransitioningDelegate: customTransitioningDelegate,
            view: view
        )
        customTouch?.delegate = self
    }
    
    //MARK: - @IBActions:
    @IBAction func backButtonTapped(_ sender: UIButton) {
        customTransitioningDelegate.isInteractive = false
        dismiss(animated: true)
    }
    
    //MARK: - Override Touches methods:
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        customTouch?.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        customTouch?.touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        customTouch?.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>,
                                   with event: UIEvent?) {
        customTouch?.touchesCancelled(touches, with: event)
    }
    
}

//MARK: - CustomTouchDelegate:
extension SecondViewController: CustomTouchDelegate {
    
    func dismissViewController() {
        dismiss(animated: true)
    }
    
}

//
//  FirstViewController.swift
//  CustomTransition
//
//  Created by Артём Устинов on 19.07.2021.
//

import UIKit

class FirstViewController: UIViewController {

    //MARK: - Override methods:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? SecondViewController else { return }
        destinationVC.transitioningDelegate = destinationVC.customTransitioningDelegate
    }

}


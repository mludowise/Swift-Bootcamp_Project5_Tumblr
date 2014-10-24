//
//  CustomTransitionViewController.swift
//  Tumbler
//
//  Created by Mel Ludowise on 10/24/14.
//  Copyright (c) 2014 Mel Ludowise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        if (destinationVC is UIViewControllerTransitioningDelegate) {
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationVC.transitioningDelegate = destinationVC as? UIViewControllerTransitioningDelegate
        }
    }

}

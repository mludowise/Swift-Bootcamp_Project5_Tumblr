//
//  CustomTransitionViewController.swift
//  Tumbler
//
//  Created by Mel Ludowise on 10/24/14.
//  Copyright (c) 2014 Mel Ludowise. All rights reserved.
//
//  This view controller checks all destination ViewControllers for custom transitions before segueing.
//

import UIKit

// Primary view controller used for all tabbing views
class CustomViewController: UIViewController {
    
    // Check for custom tansitions
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        if (destinationVC is UIViewControllerTransitioningDelegate) {
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationVC.transitioningDelegate = destinationVC as? UIViewControllerTransitioningDelegate
        }
    }

}

//
//  LoginViewController.swift
//  Tumbler
//
//  Created by Mel Ludowise on 10/24/14.
//  Copyright (c) 2014 Mel Ludowise. All rights reserved.
//

import UIKit

private let kFadeInDuration = 0.4

class FadeInViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    private var isPresenting = true
    
    override func viewDidLoad() {
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return kFadeInDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var fadeInViewController = transitionContext.viewControllerForKey(isPresenting ? UITransitionContextToViewControllerKey : UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
            containerView.addSubview(fadeInViewController.view)
            fadeInViewController.view.alpha = 0
            UIView.animateWithDuration(kFadeInDuration, animations: { () -> Void in
                fadeInViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(kFadeInDuration, animations: { () -> Void in
                fadeInViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fadeInViewController.view.removeFromSuperview()
            }
        }
    }

}

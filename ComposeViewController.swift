//
//  ComposeViewController.swift
//  Tumbler
//
//  Created by Mel Ludowise on 10/24/14.
//  Copyright (c) 2014 Mel Ludowise. All rights reserved.
//

import UIKit

private let fadeInDuration = 0.4

private let buttonAppearDelayAndDurations :[(delay: NSTimeInterval, duration: NSTimeInterval)] = [
    (0.1, 0.4),   // Text Button
    (0.0, 0.2),   // Photo Button
    (0.0, 0.5),   // Quote Button
    (0.1, 0.5),   // Link Button
    (0.0, 0.4),   // Chat Button
    (0.1, 0.6)    // Video Button
]

private let buttonDisappearDelayAndDurations :[(delay: NSTimeInterval, duration: NSTimeInterval)] = [
    (0.0, 0.6),   // Text Button
    (0.0, 0.3),   // Photo Button
    (0.0, 0.5),   // Quote Button
    (0.0, 0.7),   // Link Button
    (0.0, 0.3),   // Chat Button
    (0.0, 0.8)    // Video Button
]

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    private var isPresenting = true
    private var buttons : [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons.append(textButton)
        buttons.append(photoButton)
        buttons.append(quoteButton)
        buttons.append(linkButton)
        buttons.append(chatButton)
        buttons.append(videoButton)
    }
    
    override func viewDidAppear(animated: Bool) {
        for (i, button) in enumerate(buttons) {
            button.hidden = false
            if (animated) {
                var offset = view.frame.height - button.frame.origin.y
                button.transform = CGAffineTransformMakeTranslation(0, offset)
                var duration = buttonAppearDelayAndDurations[i].duration
                var delay = buttonAppearDelayAndDurations[i].delay
                
                UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
                    button.transform = CGAffineTransformIdentity
                    }, completion: nil)
            }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        for (i, button) in enumerate(buttons) {
            button.hidden = false
            if (animated) {
                var offset = -button.frame.origin.y - button.frame.height
                var duration = buttonAppearDelayAndDurations[i].duration
                var delay = buttonAppearDelayAndDurations[i].delay
                
                UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: nil, animations: { () -> Void in
                    button.transform = CGAffineTransformMakeTranslation(0, offset)
                    }, completion: nil)
            }
        }
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
        return fadeInDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var composeViewController = transitionContext.viewControllerForKey(isPresenting ? UITransitionContextToViewControllerKey : UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
            containerView.addSubview(composeViewController.view)
            composeViewController.view.alpha = 0
            UIView.animateWithDuration(fadeInDuration, animations: { () -> Void in
                composeViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(fadeInDuration, animations: { () -> Void in
                composeViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    composeViewController.view.removeFromSuperview()
            }
        }
    }
    
    @IBAction func onNevermndButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

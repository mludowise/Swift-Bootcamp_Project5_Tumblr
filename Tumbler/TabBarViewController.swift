//
//  TabBarViewController.swift
//  Tumbler
//
//  Created by Mel Ludowise on 10/24/14.
//  Copyright (c) 2014 Mel Ludowise. All rights reserved.
//

import UIKit

let kHomeViewControllerID = "homeViewController"
let kSearchViewControllerID = "searchViewController"
let kComposeViewControllerID = "composeViewController"
let kAccountViewControllerID = "accountViewController"
let kTrendingViewControllerID = "trendingViewController"

private let animationDuration = 0.4

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var homeViewController : UIViewController!
    var searchViewController : UIViewController!
    var accountViewController : UIViewController!
    var trendingViewController : UIViewController!
    
    
    var currentTabButton : UIButton!
    var selectedViewController : UIViewController!
    
    var isPresenting = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewController = storyboard?.instantiateViewControllerWithIdentifier(kHomeViewControllerID) as UIViewController
        searchViewController = storyboard?.instantiateViewControllerWithIdentifier(kSearchViewControllerID) as UIViewController
        accountViewController = storyboard?.instantiateViewControllerWithIdentifier(kAccountViewControllerID) as UIViewController
        trendingViewController = storyboard?.instantiateViewControllerWithIdentifier(kTrendingViewControllerID) as UIViewController
        
        currentTabButton = homeButton
        selectedViewController = homeViewController
        
        // Allows compose modal to be transparent
//        self.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
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
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return animationDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(animationDuration, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(animationDuration, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    @IBAction func onTabButton(sender: UIButton) {
        var viewController = homeViewController
        switch (sender) {
        case searchButton:
            viewController = searchViewController
            break
        case accountButton:
            viewController = accountViewController
            break
        case trendingButton:
            viewController = trendingViewController
            break
        default: // Home Button
            viewController = homeViewController
        }
        
        currentTabButton.selected = false
        sender.selected = true
        currentTabButton = sender
        selectViewController(viewController)
    }
    
    private func selectViewController(viewController: UIViewController) {
        if (selectedViewController == viewController) { // Already selected
            return
        }
        
        var toView = viewController.view
        toView.frame = contentView.frame
        contentView.addSubview(toView)
        selectedViewController.view.removeFromSuperview()
        selectedViewController.removeFromParentViewController()
        selectedViewController = viewController
    }
}

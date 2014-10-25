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

class TabBarViewController: ViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var explorePopupView: UIImageView!
    
    var viewControllers : [UIViewController] = []
    var currentTabButton : UIButton!
    var selectedViewController : UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers.append(storyboard?.instantiateViewControllerWithIdentifier(kHomeViewControllerID) as UIViewController)
        viewControllers.append(storyboard?.instantiateViewControllerWithIdentifier(kSearchViewControllerID) as UIViewController)
        viewControllers.append(storyboard?.instantiateViewControllerWithIdentifier(kAccountViewControllerID) as UIViewController)
        viewControllers.append(storyboard?.instantiateViewControllerWithIdentifier(kTrendingViewControllerID) as UIViewController)
        
        currentTabButton = homeButton
        currentTabButton.selected = true
        selectedViewController = viewControllers[0]
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            self.explorePopupView.frame.offset(dx: 0, dy: 8)
        }, completion: nil)
    }
        
    @IBAction func onTabButton(sender: UIButton) {
        currentTabButton.selected = false
        sender.selected = true
        currentTabButton = sender
        
        var viewController = viewControllers[sender.tag]
        explorePopupView.hidden = viewController is SearchViewController
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

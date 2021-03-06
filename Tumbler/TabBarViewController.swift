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

class TabBarViewController: CustomViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var explorePopupView: UIImageView!
    
    var viewControllers : [UIViewController] = []
    var currentTabButton : UIButton!
    var currentViewController : UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers.append(storyboard?.instantiateViewControllerWithIdentifier(kHomeViewControllerID) as UIViewController)
        viewControllers.append(storyboard?.instantiateViewControllerWithIdentifier(kSearchViewControllerID) as UIViewController)
        viewControllers.append(storyboard?.instantiateViewControllerWithIdentifier(kAccountViewControllerID) as UIViewController)
        viewControllers.append(storyboard?.instantiateViewControllerWithIdentifier(kTrendingViewControllerID) as UIViewController)
        
        currentTabButton = homeButton
        currentTabButton.selected = true
        currentViewController = viewControllers[0]
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            self.explorePopupView.frame.offset(dx: 0, dy: 8)
            }, nil)
    }
        
    @IBAction func onTabButton(sender: UIButton) {
        currentTabButton.selected = false
        sender.selected = true
        currentTabButton = sender
        
        var viewController = viewControllers[sender.tag]
        explorePopupView.hidden = viewController is SearchViewController
        selectViewController(viewController)
    }
    
    private func selectViewController(nextViewController: UIViewController) {
        if (currentViewController == nextViewController) { // Already selected
            return
        }
        
        nextViewController.view.frame = contentView.frame
        contentView.addSubview(nextViewController.view)
        self.addChildViewController(nextViewController)
        currentViewController.view.removeFromSuperview()
        currentViewController.removeFromParentViewController()
        currentViewController = nextViewController
    }
}

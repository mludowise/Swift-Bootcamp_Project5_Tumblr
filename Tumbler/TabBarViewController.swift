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
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
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
        selectedViewController = viewControllers[0]
    }
        
    @IBAction func onTabButton(sender: UIButton) {
        currentTabButton.selected = false
        sender.selected = true
        currentTabButton = sender
        selectViewController(viewControllers[sender.tag])
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

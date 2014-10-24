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
    
    var homeViewController : UIViewController!
    var searchViewController : UIViewController!
    var accountViewController : UIViewController!
    var trendingViewController : UIViewController!
    
    
    var currentTabButton : UIButton!
    var selectedViewController : UIViewController!
    
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

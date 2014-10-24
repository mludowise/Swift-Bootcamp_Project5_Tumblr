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

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var currentTabButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTabButton = homeButton
    }
    
    @IBAction func onTabButton(sender: UIButton) {
        var viewControllerID = kHomeViewControllerID
        switch (sender) {
        case searchButton:
            viewControllerID = kSearchViewControllerID
            break
        case composeButton:
            viewControllerID = kComposeViewControllerID
            break
        case accountButton:
            viewControllerID = kAccountViewControllerID
            break
        case trendingButton:
            viewControllerID = kTrendingViewControllerID
            break
        default: // Home Button
            viewControllerID = kHomeViewControllerID
        }
        
        var viewController = storyboard?.instantiateViewControllerWithIdentifier(viewControllerID) as UIViewController
        
        currentTabButton.selected = false
        if (sender == composeButton) {
            presentViewController(viewController, animated: true, completion: nil)
        } else {
            sender.selected = true
            contentView.addSubview(viewController.view)
        }
        
    }
}

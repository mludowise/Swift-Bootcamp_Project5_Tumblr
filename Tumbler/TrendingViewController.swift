//
//  TrendingViewController.swift
//  Tumbler
//
//  Created by Mel Ludowise on 10/24/14.
//  Copyright (c) 2014 Mel Ludowise. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (scrollView.subviews.count > 0) {
            var view = scrollView.subviews[0] as UIView
            scrollView.contentSize = CGSize(width: view.frame.width + view.frame.origin.x,
                height: view.frame.height + view.frame.origin.y)
        }
    }
}

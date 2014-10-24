//
//  SearchViewController.swift
//  Tumbler
//
//  Created by Mel Ludowise on 10/24/14.
//  Copyright (c) 2014 Mel Ludowise. All rights reserved.
//

import UIKit

private let kLoadingImages = [
    "loading-1",
    "loading-2",
    "loading-3",
]

class SearchViewController: ViewController {

    @IBOutlet weak var loadingImageView: UIImageView!
    @IBOutlet weak var searchFeed: UIImageView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateKeyframesWithDuration(2, delay: 0, options: nil, animations: { () -> Void in
            var duration = 1 / Double(kLoadingImages.count)
            for (i, imageName) in enumerate(kLoadingImages) {
                var start = Double(i) * duration
                println("Start: \(start) Duration:\(duration)")
                UIView.addKeyframeWithRelativeStartTime(start, relativeDuration: duration, animations: { () -> Void in
                    self.loadingImageView.image = UIImage(named: imageName)
                    println(imageName)
                })
            }
            }) { (b: Bool) -> Void in
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.searchFeed.alpha = 1
            })
        }
    }
}

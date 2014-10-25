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

private let kLoadingFrameTime = 0.25

class SearchViewController: ViewController {

    @IBOutlet weak var loadingImageView: UIImageView!
    @IBOutlet weak var searchFeed: UIImageView!
    
    private var loadingImageIndex = 0
    
    override func viewDidAppear(animated: Bool) {
        animateLoading(2, completion: { () -> Void in
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.searchFeed.alpha = 1
                self.loadingImageView.alpha = 0
            })
        })
//        super.viewDidAppear(animated)
//        
//        UIView.animateKeyframesWithDuration(2, delay: 0, options: nil, animations: { () -> Void in
//            var duration = 1 / Double(kLoadingImages.count)
//            for (i, imageName) in enumerate(kLoadingImages) {
//                var start = Double(i) * duration
//                println("Start: \(start) Duration:\(duration)")
//                UIView.addKeyframeWithRelativeStartTime(start, relativeDuration: duration, animations: { () -> Void in
//                    self.loadingImageView.image = UIImage(named: imageName)
//                    println(imageName)
//                })
//            }
//            }) { (b: Bool) -> Void in
//            UIView.animateWithDuration(0.2, animations: { () -> Void in
//                self.searchFeed.alpha = 1
//            })
//        }
    }
    
    private func animateLoading(duration: NSTimeInterval, completion: () -> Void) {
        if (duration <= 0) {
            completion()
            return
        }
        loadingImageView.image = UIImage(named: kLoadingImages[loadingImageIndex])
        loadingImageIndex = (loadingImageIndex + 1) % kLoadingImages.count
        delay(kLoadingFrameTime, { () -> () in
            self.animateLoading(duration - kLoadingFrameTime, completion)
        })
    }
}

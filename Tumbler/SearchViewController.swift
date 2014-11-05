//
//  SearchViewController.swift
//  Tumbler
//
//  Created by Mel Ludowise on 10/24/14.
//  Copyright (c) 2014 Mel Ludowise. All rights reserved.
//

import UIKit

private let kLoadingImageNames = [
    "loading-1",
    "loading-2",
    "loading-3",
]

private let kLoadingFrameTime = 0.25

class SearchViewController: CustomViewController {

    @IBOutlet weak var loadingImageView: UIImageView!
    @IBOutlet weak var searchFeed: UIImageView!
    
    private var loadingImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var loadingImages : [UIImage] = []
        for imageName in kLoadingImageNames {
            loadingImages.append(UIImage(named: imageName)!)
        }
        
        loadingImageView.animationImages = loadingImages
        loadingImageView.animationDuration = 0.7
    }
    
    override func viewDidAppear(animated: Bool) {
        loadingImageView.startAnimating()
        delay(2, { () -> () in
            self.loadingImageView.stopAnimating()
            self.searchFeed.alpha = 1
            self.loadingImageView.alpha = 0
        })
    }
}

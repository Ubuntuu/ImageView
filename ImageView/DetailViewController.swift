//
//  DetailViewController.swift
//  ImageView
//
//  Created by Tommy Troest on 11/12/2019.
//  Copyright © 2019 Tommy Troest. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    /// The name of the selected image
    var selectedImage: String?
    
    /// Image View from Interface Builder.
    @IBOutlet var imageView: UIImageView!
    
    /// Setup when the view did load.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Navigation bar title set large display mode to never.
        navigationItem.largeTitleDisplayMode = .never
        
        // Title on the navigation bar.
        title = selectedImage
        
        // will only set image, if imageSelected is not nil
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    /// Setup Navigation behaviour before the view appears.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // hides navigation bar when the view appears.
        navigationController?.hidesBarsOnTap = true
    }
    
    /// Setup Navigation behaviour when the view disappears.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // makes navigation bar visible when the view disappers.
        navigationController?.hidesBarsOnTap = false
    }
}

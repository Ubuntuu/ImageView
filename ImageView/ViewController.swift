//
//  ViewController.swift
//  ImageView
//
//  Created by Tommy Troest on 11/12/2019.
//  Copyright © 2019 Tommy Troest. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // array of pictures names.
    var pictures = [String]()
    
    /// Will setup and load pictures when the view did load.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = false
        
        // Navigation bar title
        title = "Images from South Africa 2016"
        
        // filemanager
        let fm = FileManager.default
        // path for the app bundle
        let path = Bundle.main.resourcePath!
        // for items in the path
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // looping through all items in the path
        for item in items {
            // check if name pattern matches the prefix
            if item.hasPrefix("za_") {
                // appends item to pictures on name pattern match
                pictures.append(item)
            }
        }
    }

    /// Sets number of rows to the number of items in pictures array.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of Rows in a section
        return pictures.count
    }
    
    /// sets sells as reusable with identifier Picture and sets the cells text to display the picture file name.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            // 3: Now push it into the navigigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}


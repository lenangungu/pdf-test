//
//  MainViewController.swift
//  pdf test
//
//  Created by Lena Ngungu on 1/2/18.
//  Copyright © 2018 Lena Ngungu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    /*
    // I need to:
    - Check why apostrophes arent found in search!!!
    - Check favorite function
    - Implement favorite screen from home ------- load the PDF in the main view (hide) and initialize in the main view that way segue will transfer to both screens
    - Handle keyboard after use taps on screes (search)
    - Add load indicator while pg searching
    - Chech rotation
    - categorize: use range of identifier to strore them in different arrays.
    */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMainViewController(_ segue: UIStoryboardSegue) {
        
    }

}

//
//  MainViewController.swift
//  pdf test
//
//  Created by Lena Ngungu on 1/2/18.
//  Copyright © 2018 Lena Ngungu. All rights reserved.
//
/*
import UIKit

class MainViewController: UIViewController {
    
    var favorites = [""]
    /*
     // I need to:
     - Pitch pie: "http://www.harmonize.com/metropolis/online_pitch_pipe.htm" "
     
     -  FURTHER UPDATES -
     - categorize: use range of identifier to strore them in different arrays. - as update maybe
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        print(favorites)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC"
        {
            let destinatiionVC = segue.destination as! secondViewController
            destinatiionVC.favorites = favorites
        }
        
        if segue.identifier == "toFavVC"
        {
            let destinatiionVC = segue.destination as! FavoritesViewController
            destinatiionVC.favorites = favorites
            destinatiionVC.segueFrom = "main"
        }
        
    }
    
    @IBAction func unwindToMainViewController(_ segue: UIStoryboardSegue) {
        
    }
    
}
 */

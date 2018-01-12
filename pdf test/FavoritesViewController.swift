//
//  FavoritesViewController.swift
//  pdf test
//
//  Created by Lena Ngungu on 1/2/18.
//  Copyright © 2018 Lena Ngungu. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var favorites : [String]? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("favorites are: \(favorites)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToMain"
        {
            let destinatiionVC = segue.destination as! MainViewController
            destinatiionVC.favorites = favorites!
        }
    }

}
extension FavoritesViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (favorites?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell") as! FavoritwCellTableViewCell
        
            cell.title.text = favorites![indexPath.row]
         
//        if (indexPath.row >= 0 && indexPath.row <= 3)
//        {
//            cell.backgroundColor = UIColor.init(red: 204/255, green: 50/255, blue: 50/255, alpha: 1)
//
//        }
//        else if (indexPath.row > 3 && indexPath.row <= 7)
//        {
//         cell.backgroundColor = UIColor.init(red: 154/255, green: 34/255, blue: 41/255, alpha: 1)
//        }
//        else
//        {
//        cell.backgroundColor = UIColor.init(red: 100/255 , green: 35/255, blue: 38/255, alpha: 1)
//        }
        
        return cell
    }
    
    
}
extension FavoritesViewController: UITableViewDelegate
{
    
}

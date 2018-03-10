//
//  FavoritesViewController.swift
//  pdf test
//
//  Created by Lena Ngungu on 1/2/18.
//  Copyright © 2018 Lena Ngungu. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet var backToMainButton: UIBarButtonItem!
    
    @IBOutlet var backToSongsButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    var favorites : [String]? 
    var segueFrom : String? 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let favoritesDefaults : AnyObject = defaults.object(forKey: "favorites") as AnyObject {
            favorites = favoritesDefaults as! [String]
        }
        self.tableView.reloadData()
        
       // print("favorites are: \(favorites)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC"
        {
            //UNWIND INSTEAD 
            let destinatiionVC = segue.destination as! secondViewController
            let sender = sender as! FavoritwCellTableViewCell
            destinatiionVC.favTitle = sender.title.text
            destinatiionVC.favorites = favorites!
        }
         if segue.identifier == "unwindToSecond"
         {
            let destinatiionVC = segue.destination as! secondViewController
            destinatiionVC.favorites = favorites!
        }
    }
    
   
    

}
extension FavoritesViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((favorites?.count)! - 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell") as! FavoritwCellTableViewCell
        
            cell.title.text = favorites![indexPath.row + 1]
         
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
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favTitle = favorites![indexPath.row]
        performSegue(withIdentifier: "toSecondVC", sender: (Any).self)
    }
    */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete)
        {
           // print(indexPath.row)
           
            favorites!.remove(at: indexPath.row)
            tableView.reloadData()
            let defaults = UserDefaults.standard // 1
            
           // defaults.removeObject(forKey: "favorites")
            defaults.set(favorites, forKey: "favorites")
            defaults.synchronize()
            
        }
    }
}

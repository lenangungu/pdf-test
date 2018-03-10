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
    //var favorites : [String]?
    //var checked : [String]?
    var favorites : [String]?
    var checked : [String]?
    
    var segueFrom : String? 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // INEFFICIENT, DO THIS ONCE IN FIRST VIEW
        
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
            
            let destinatiionVC = segue.destination as! secondViewController
            let sender = sender as! FavoritwCellTableViewCell
            destinatiionVC.favTitle = sender.title.text
            
            destinatiionVC.favorites = self.favorites!
            destinatiionVC.checked = checked!
    
        }
        if segue.identifier == "unwindToSecond"
        {
            let destinatiionVC = segue.destination as! secondViewController
            
            destinatiionVC.favorites = self.favorites!
            destinatiionVC.checked = checked!
        }
        
    }
    
    
    
    
}
extension FavoritesViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return ((favorites?.count)! )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell") as! FavoritwCellTableViewCell
        
        cell.title.text = favorites?[indexPath.row ]
   
            if (checked?[indexPath.row] == "true")
        {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
 
        }
       
        
        
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
    func done (action: UITableViewRowAction, index: IndexPath){
        //tableView.cellForRow(at: index) ->> change image to blue tick
         let cell = tableView.cellForRow(at: index) as! FavoritwCellTableViewCell
        //tableView.cellForRow(at: index)?.accessoryType = .checkmark
       
        checked?[index.row] = "true"
        cell.accessoryType = .checkmark
        let defaults = UserDefaults.standard // 1
        
        // defaults.removeObject(forKey: "favorites")
        defaults.set(checked, forKey: "checked")
        defaults.synchronize()
    }
    
    func delete(action: UITableViewRowAction, index: IndexPath)
    {
        favorites?.remove(at: index.row)
        checked?.remove(at: index.row)
        tableView.reloadData()
        let defaults = UserDefaults.standard // 1
        
        // defaults.removeObject(forKey: "favorites")
        defaults.set(favorites, forKey: "favorites")
        defaults.set(checked, forKey: "checked")
        defaults.synchronize()
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let doneAction = UITableViewRowAction(style: .normal, title: "Done", handler: done)
        doneAction.backgroundColor = UIColor.green 
        
        let deletAction = UITableViewRowAction(style: .normal, title: "Delete", handler: delete)
        deletAction.backgroundColor = UIColor.red
       
        
        return [deletAction,doneAction]
    }
   /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if (editingStyle == .delete)
        {
            // print(indexPath.row)
            
           
            
        }
      
    }
 */
}

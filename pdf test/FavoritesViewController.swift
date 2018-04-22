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
    
    var favorites = [""]
    var checked = [""]
    
    var segueFrom : String?
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.reloadData()
        
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
            
            destinatiionVC.favorites = self.favorites
            destinatiionVC.checked = checked
            
            
            
        }
        if segue.identifier == "unwindToSecond"
        {
            let destinatiionVC = segue.destination as! secondViewController
            
            destinatiionVC.favorites = self.favorites
            destinatiionVC.checked = checked
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    
    
}
extension FavoritesViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if ((favorites.count) > 1){
            return ((favorites.count) - 1)
        }
        else {return 0}
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell") as! FavoritwCellTableViewCell
        
        cell.title.text = (favorites[indexPath.row + 1]).capitalized // first lettes caps
        
        if (checked[indexPath.row + 1] == "true")
        {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
            
        }
        
        return cell
    }
    
    
}
extension FavoritesViewController: UITableViewDelegate
{
    
    func done (action: UITableViewRowAction, index: IndexPath){
        
        let cell = tableView.cellForRow(at: index) as! FavoritwCellTableViewCell
        
        checked[index.row + 1] = "true"
        cell.accessoryType = .checkmark
        let defaults = UserDefaults.standard 
        
        defaults.set(checked, forKey: "checked")
        defaults.synchronize()
    }
    
    func delete(action: UITableViewRowAction, index: IndexPath)
    {
        favorites.remove(at: index.row + 1)
        checked.remove(at: index.row + 1)
        tableView.reloadData()
        let defaults = UserDefaults.standard
        
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
    
}

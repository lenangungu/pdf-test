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
    

}
extension FavoritesViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (favorites?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell") as! FavoritwCellTableViewCell
        
            cell.title.text = favorites![indexPath.row]
        
        return cell
    }
    
    
}
extension FavoritesViewController: UITableViewDelegate
{
    
}

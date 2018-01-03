//
//  secondViewController.swift
//  pdf test
//
//  Created by Lena Ngungu on 12/28/17.
//  Copyright © 2017 Lena Ngungu. All rights reserved.
//

import UIKit
import PDFKit

class secondViewController: UIViewController, PDFViewDelegate{
    @IBOutlet var secondView: PDFView!
    @IBOutlet var searchBar: UISearchBar!
    var pgNum: Int?
    var pgTitle: String?
    @IBOutlet var navBar: UINavigationBar!
    
    var favorites = [""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.alpha = 0
        let path = URL(fileReferenceLiteralResourceName: "PDF.pdf")
       secondView.document = PDFDocument(url: path)
  //   print(secondView.currentPage.
        let points = CGPoint(x: 5.0, y: 0.0)
      secondView.page(for: points, nearest: true)
        
     secondView.reloadInputViews()
     secondView.go(to: secondView.document!.page(at: 18)!)
    
        
        secondView.document?.page(at: 18)?.accessibilityValue = "create in me a pure heart"
        secondView.document?.page(at: 19)?.accessibilityValue = "be still and know i am god"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 24)?.accessibilityValue = "his love endures forever"
        secondView.document?.page(at: 27)?.accessibilityValue = "unto thee o lord"
        secondView.document?.page(at: 28)?.accessibilityValue = "the law of the lord"
        secondView.document?.page(at: 29)?.accessibilityValue = "the steadfast love of the lord"
        secondView.document?.page(at: 30)?.accessibilityValue = "i will call upon the lord"
        secondView.document?.page(at: 31)?.accessibilityValue = "humble yourself in the sight of the lord"
        secondView.document?.page(at: 32)?.accessibilityValue = "praise god"
        secondView.document?.page(at: 33)?.accessibilityValue = "shout for joy"
        secondView.document?.page(at: 34)?.accessibilityValue = "praise the lord"
        secondView.document?.page(at: 35)?.accessibilityValue = "o praise the lord"
        secondView.document?.page(at: 36)?.accessibilityValue = "rejoice in the law of the lord"
        secondView.document?.page(at: 37)?.accessibilityValue = "o lord our lord"
        secondView.document?.page(at: 39)?.accessibilityValue = "rejoice in the lord always"
        
        // start here
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        secondView.document?.page(at: 21)?.accessibilityValue = "have you not heard"
        /*
        var myPage = secondView.document?.page(at: 17)
        myPage?.mutableSetValue(forKey: "create")
        myPage?.accessibilityAttributedValue = NSAttributedString(string: "hiii")
        print(myPage?.accessibilityAttributedValue)
        */
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchAction(_ sender: Any) {
        navBar.alpha = 0
        searchBar.alpha = 1
        // Make keyboard appear?? 
    }
    
   
    @IBAction func addToFavAction(_ sender: Any) {
        var current = secondView.currentPage
        if (current?.accessibilityValue != nil)
        {
        favorites.append((current?.accessibilityValue)!)
        } 
        /*
        if current?.accessibilityValue is not in array
        {
        favorites.append(current?.accessibilityValue)
            // change button to lit
        }
        else
        { // get index in array and
            favorites.remove(at: <#T##Int#>)
            //chnage button to unlit
        }
  */
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinatiionVC = segue.destination as! FavoritesViewController
        destinatiionVC.favorites = favorites
    }
    
    @IBAction func unwindToSecondViewController(_ segue: UIStoryboardSegue) {
        
    }
    
}


extension secondViewController: UISearchBarDelegate{
       // searchBarTextDidEndEditing

    
func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var pages = 0
        let songTitle = searchBar.text!
    
        print(songTitle)
        let currentPage = secondView.currentPage
        var myPage = secondView.document?.page(at: 0)
        secondView.goToFirstPage(self)

       // while ((myPage!.accessibilityValue?.range(of: songTitle.lowercased())) == nil) // Make sure it's the first part
       // while (pageValue!.starts(with: songTitle.lowercased()) == false)
    
         while (((myPage!.accessibilityValue?.hasPrefix(songTitle.lowercased())) != true) && (pages != 339))
        {
            //add loading indicator !!
            secondView.goToNextPage(self)
            myPage = secondView.currentPage
            pages += 1
            
            // dismiss keyboard
            //Tap recognition to dismiss search bar and keyboard !! 
        }
        if (pages == 339)
        {
            secondView.go(to: currentPage!)
        }
    searchBar.alpha = 0
    navBar.alpha = 1
    }
 
    
    
    }




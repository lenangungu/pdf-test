//
//  PitchPipeViewController.swift
//  pdf test
//
//  Created by Lena Ngungu on 7/21/19.
//  Copyright © 2019 Lena Ngungu. All rights reserved.
//

import UIKit
import AVFoundation

class PitchPipeViewController: UIViewController {

    var noteSound: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func notePressed(note: String)
    {
        let path = Bundle.main.path(forResource: note, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            noteSound = try AVAudioPlayer(contentsOf: url)
            noteSound?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    @IBAction func Apressed(_ sender: Any) {
        //let button = sender as! UIButton
        //notePressed(note: button.title(for: .normal)!)
        notePressed(note:"ANatural (1).mp3")
    }
    
    @IBAction func AFlatPressed(_ sender: Any) {
       // let button = sender as! UIButton
        notePressed(note:"AFlat.mp3")
    }
    
    
    @IBAction func Bpressed(_ sender: Any) {
      //  let button = sender as! UIButton
        notePressed(note:"BNatural.mp3")
    }
    
    @IBAction func BFlatPressed(_ sender: Any) {
      //  let button = sender as! UIButton
        notePressed(note:"BFlat.mp3")
    }
    
    @IBAction func CPressed(_ sender: Any) {
         notePressed(note:"CNatural.mp3")
    }
    
    @IBAction func CSharpPressed(_ sender: Any) {
         notePressed(note:"CSharp.mp3")
    }
    
    @IBAction func DPressed(_ sender: Any) {
         notePressed(note:"DNatural.mp3")
    }
    @IBAction func EPressed(_ sender: Any) {
         notePressed(note:"ENaturalLow.mp3")
    }
    
    @IBAction func FPressed(_ sender: Any) {
         notePressed(note:"FNatural.mp3")
    }
    
    @IBAction func FSharpPressed(_ sender: Any) {
        notePressed(note:"FSharp.mp3")
    }
    
    
    @IBAction func GPressed(_ sender: Any) {
         notePressed(note:"GNatural.mp3")
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

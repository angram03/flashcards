//
//  ViewController.swift
//  flashcards
//
//  Created by Angelica Ramirez on 9/15/22.
//

import UIKit

class ViewController: UIViewController {
    var flashcardsController: ViewController!
    
 
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTaponFlashcard(_ sender: Any) {
        frontLabel.isHidden = true
        
    }
    
    
    
    
    
   
    
    func updateFlashcard(question: String, answer: String){
    
        
        
    }
    
   
}


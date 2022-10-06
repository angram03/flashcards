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

   
  
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
    //1 We know the destination of the segue is the Navigation Controller
    let navigationController = segue.destination as! UINavigationController
    // We know the Navigation Controller only contains a Creation View Controller
    let creationController = navigationController.topViewController as! CreationViewController
    // We set the flashcardsController property to self
    creationController.flashcardsController=self
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

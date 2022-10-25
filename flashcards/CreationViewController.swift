//
//  CreationViewController.swift
//  flashcards
//
//  Created by Angelica Ramirez on 10/5/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


   
   
    
    @IBOutlet weak var questionTextField: UITextField!
    
    
    @IBOutlet weak var answerTextField: UITextField!
    
    
    @IBAction func DidTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func DidTapOnDone(_ sender: Any) {
        
       
        let questionText = questionTextField.text
        // Get the text in the answer text field
        let answerText = answerTextField.text
        // Call the function to update the flashcard
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        //Dismiss
        dismiss(animated: true)
        
        
        
        
        
       
}
    
    
    

    
    
   
}


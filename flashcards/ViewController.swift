//
//  ViewController.swift
//  flashcards
//
//  Created by Angelica Ramirez on 9/15/22.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    
}



class ViewController: UIViewController {
    var flashcardsController: ViewController!
    
 
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    var flashcards = [Flashcard]()
    //current index for flashcards
    var currentIndex = 0
    
    
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            updateFlashcard(question: "What's the capital of Brazil?", answer: "Brasilia")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
        
    }

    @IBAction func didTaponFlashcard(_ sender: Any) {
        
       
        
        flipFlashcard()
        

    }

   
    
    @IBOutlet weak var card: UIView!
    
 
    
    

    
    func flipFlashcard() {
        if (frontLabel.isHidden == true){
            frontLabel.isHidden = false}
        else{
            frontLabel.isHidden = true
            
        }
        
        
        UIView.transition(with: card, duration: 0.3, options: .transitionFlipFromRight, animations:  {
            if(self.frontLabel.isHidden == true){
                self.backLabel.isHidden = false}
            else{
                self.frontLabel.isHidden = false
            }
           
        })
        
    }
  
    
    func animateCardOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.card.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
        }, completion: { finished in
            self.updateLabels()
            
            
            
            
            
            
            self.animateCardIn()
        })
    }
    
    func animateCardIn() {
        card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
        
        
        UIView.animate(withDuration: 0.3) {
            self.card.transform = CGAffineTransform.identity
        }
    }
        
       
    
    
    
    
   
    
    func updateFlashcard(question: String, answer: String){
        let flashcard = Flashcard(question: question, answer: answer)
       // frontLabel.text = flashcard.question
       // backLabel.text = flashcard.answer
        flashcards.append(flashcard)
        
        print("Added a new FlashCard, take a look-> ", flashcards)
        print(" we have \(flashcards.count) flashcards")
        
        //update current index
        currentIndex = flashcards.count - 1
        print("our current index is \(currentIndex)")
        
        //update prev button
        updateNextPrevButtons()
        
        updateLabels()
        saveAllFlashcardsToDisk()
}
   
    
    
    
    @IBAction func DidTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        
        //updateLabels()
        updateNextPrevButtons()
        
        animateCardOut()
    }
    
    func updateLabels() {
     
        let currentFlashcard = flashcards[currentIndex]
        
        
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        
        
    }
    

    
    
    
    @IBAction func DidTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        
        updateLabels()
        updateNextPrevButtons()
        
        
    }
    
    
    @IBOutlet weak var PrevButton: UIButton!
    
    @IBOutlet weak var NextButton: UIButton!
    
    func updateNextPrevButtons(){
        if currentIndex == flashcards.count - 1{
            NextButton.isEnabled = false
        } else {
            NextButton.isEnabled = true
        }
        

    }
    
    
    
    
    func saveAllFlashcardsToDisk() {
        //UserDefaults.standard.set(flashcards, forKey: "flashcards")
        let dictionaryArray = flashcards.map {(card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        print("flashcards saved to drive")
        
        
        
    }
    
    
    func readSavedFlashcards() {
        
     
        
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            let savedCards = dictionaryArray.map {dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            flashcards.append(contentsOf: savedCards)
            
        }
        
        
        
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

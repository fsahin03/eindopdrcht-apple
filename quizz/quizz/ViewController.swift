//
//  ViewController.swift
//  quizz
//
//  Created by SD on 21/03/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //updateQuestion()
        // Do any additional setup after loading the view.
    }
let redQuestions = ["Reuzel is gesmolten?", "De man die een doel verdedigt noemen we een?", "Welke scheldwoord is een lijster met diarree?", "Een tien met een griffel en een zoen van de?", "Een bajesklant hoort in de?", "Een spionnetje is een?", "De tegenstelling van bescheiden is?", "Het binnenste van een appel heet?"]
    
    let redAnswers = ["vet", "keeper", "schijtlijster", "juffrouw", "gevangenis", "kleine buitenspiegel", "brutaal", "klokhuis"]

    var currentQuestion = 0
    
    func updateQuestion() {
        let questions = redQuestions[currentQuestion]
        questionLabel.text = redQuestions[currentQuestion]
    }
    @IBOutlet weak var questionLabel: UILabel!
    @IBAction func nextQuestion(_ sender: Any) {
        currentQuestion += 1
        updateQuestion()
    }
    @IBAction func red(_ sender: Any) {
        updateQuestion()
        green.isHidden = true
        blue.isHidden = true
        yellow.isHidden = true
    }
    
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var yellow: UIButton!
}


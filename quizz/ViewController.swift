//
//  ViewController.swift
//  quizz
//
//  Created by SD on 21/03/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

//    let questionOne = QuizQuestion(question:  "Reuzel is gesmolten?", answer: "Vet")
//    let questionTwo = QuizQuestion(question:  "De man die een doel verdedigt noemen we een?", answer: "Keeper")
    
    var quizQuestions: [QuizQuestion] = []
    var currentQuestion = 0
    var answerIsCorrect = false
    var answerCount = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var yellow: UIButton!
    @IBOutlet weak var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateQuestion()
        // Do any additional setup after loading the view.
        answerTextField.delegate = self
        
//        quizQuestions = [questionOne, questionTwo]
        getLocalQuizData()
    }
    
    func setupQuiz() {
        print("quizQuestions is \(quizQuestions)")
    }
    
    func updateQuestion() {
        questionLabel.text = quizQuestions[currentQuestion].question
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        currentQuestion += 1
        
        if currentQuestion >= quizQuestions.count{
            currentQuestion = 0
        }
        updateQuestion()
    }
    
    @IBAction func red(_ sender: Any) {
        updateQuestion()
        green.isHidden = true
        blue.isHidden = true
        yellow.isHidden = true
    }
    
    func checkAnswer(answer: String) {
        if answer.lowercased() == quizQuestions[currentQuestion].answer.lowercased() {
            answerLabel.text = "Goed!"
            answerCount+=1
        } else {
            answerLabel.text = "Fout!"
        }
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        if let answer = textField.text {
            checkAnswer(answer: answer)
        }
        
        textField.resignFirstResponder()

        return true
    }
    
    // MARK: - JSON Functions
    
    func getLocalQuizData() {
        // Call readLocalFile function with the name of the local file (localQuizData)
        if let localData = self.readLocalFile(forName: "localQuizData") {
            // File exists, now parse 'localData' with the parse function
            self.parse(jsonData: localData)
            
            setupQuiz()
        }
    }

    // Read local file

    private func readLocalFile(forName name: String) -> Data? {
        do {
            // Check if file exists in application bundle, then try to convert it to a string, if that works return that
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error) // Something went wrong, show an alert
        }
        
        return nil
    }

    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode([QuizQuestion].self,
                                                       from: jsonData)
            /*
            print("Question: ", decodedData[0].question)
            print("Answer: ", decodedData[0].answer)
            print("===================================")
            */
            
            self.quizQuestions = decodedData
        } catch {
            print("decode error")
        }
    }
    // added a comment (for testing)
}



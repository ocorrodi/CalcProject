//
//  AnswerViewController.swift
//  Calc Project
//
//  Created by Olivia Corrodi on 6/1/18.
//  Copyright © 2018 Olivia Corrodi. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var image: UIImageView!
    var image2: String = ""
    var answerEntered = ""
    var correctAnswer = ""
    var topic: Topic = Topic(name: "", problems: [:], hints: [], notes: "", image: "", answers: [])
    var isSecond = false
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    // Do any additional setup after loading the view.
    }

    @IBAction func next(_ sender: Any) {
        if isSecond {
            performSegue(withIdentifier: "back2", sender: self)
        }
        else {
            performSegue(withIdentifier: "nextQ", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextQ" {
            let destinationVC = segue.destination as! QuestionViewController
            destinationVC.isSecond = true
            destinationVC.topic2 = topic
            destinationVC.index = index
        }
        else {
            let destinationVC = segue.destination as! RootViewController
            destinationVC.index = index
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.image.contentMode = UIViewContentMode.scaleAspectFit
        if isSecond {
            self.image.image = UIImage(named: topic.answers[1])
        } else {
            self.image.image = UIImage(named: topic.answers[0])

        }
        if answerEntered.isEqual(correctAnswer) {
            answer.text = "CORRECT!"
            self.view.backgroundColor = UIColor.green
        }
        else {
            answer.text = "INCORRECT" + "\n" + "THE CORRECT ANSWER IS:" + "\n" + correctAnswer
            self.view.backgroundColor = UIColor.red
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  QuestionViewController.swift
//  Calc Project
//
//  Created by Olivia Corrodi on 5/31/18.
//  Copyright © 2018 Olivia Corrodi. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var answer: UIPickerView!
    
    var num: String = ""
    
    var index = 0
    
    var pickerData: [String] = ["A","B","C","D","E"]
    
    var topic2: Topic = Topic(name: "", problems: [:], hints: [], notes: "", image: "", answers: [])
    
    var isSecond = false
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showA", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! AnswerViewController
        destinationVC.image = self.image
        destinationVC.answerEntered = num
        destinationVC.correctAnswer = Array(topic2.problems.values)[0]
        destinationVC.topic = topic2
        destinationVC.image2 = Array(self.topic2.problems.keys)[0]
        if isSecond {
            destinationVC.isSecond = true
            destinationVC.image2 = Array(self.topic2.problems.keys)[1]
            destinationVC.correctAnswer = Array(self.topic2.problems.values)[1]
            destinationVC.index = index
        }
        else {
            let destinationVC2 = segue.destination as! AnswerViewController
            destinationVC2.index = index
        }
    }
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.image.contentMode = UIViewContentMode.scaleAspectFit
        //answer.font = UIFont(name: "System", size: 40.0)
        if isSecond {
            image.image = UIImage(named: Array(topic2.problems.keys)[1])
        }
        else {
            image.image = UIImage(named: Array(topic2.problems.keys)[0])
        }
        self.view.addSubview(image)
        self.answer.dataSource = self
        self.answer.delegate = self
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 100.0)!])
        return myTitle
        
    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!,NSForegroundColorAttributeName:UIColor.black])
        pickerLabel.attributedText = myTitle
        return pickerLabel
    }
    
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        num = pickerData[row]
    }
    
//ghj
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
//ghkj
}

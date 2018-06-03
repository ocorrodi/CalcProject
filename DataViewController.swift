//
//  DataViewController.swift
//  Calc Project
//
//  Created by Olivia Corrodi on 5/31/18.
//  Copyright © 2018 Olivia Corrodi. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var text2: UITextView!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text3: UITextView!
    @IBOutlet weak var image3: UIImageView!
    var dataObject: Topic = Topic(name: "", problems: [:], hints: [], notes: "", image: "")
    var index = 0;
    @IBAction func hints2(_ sender: Any) {
        performSegue(withIdentifier: "hints", sender: self)
    }
    
    @IBAction func practice2(_ sender: Any) {
        performSegue(withIdentifier: "showQ", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? QuestionViewController
        {   destinationVC.topic2 = dataObject
            destinationVC.index = index}
        else {
            let destinationVC = segue.destination as! HintsViewController
            destinationVC.hints2 = dataObject.hints
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //text3.isUserInteractionEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject.name
        self.image3.image = UIImage(named: dataObject.image)
        self.text2.text = dataObject.notes
        self.image3.contentMode = UIViewContentMode.scaleAspectFit
        //self.navigationController!.title = dataObject.name
        self.navigationItem.title = "HELLO"
        self.navigationController?.navigationBar.topItem?.title = "HELLO"
    }
    
    
}

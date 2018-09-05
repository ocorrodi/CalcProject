//
//  HintsViewController.swift
//  Calc Project
//
//  Created by Olivia Corrodi on 6/2/18.
//  Copyright © 2018 Olivia Corrodi. All rights reserved.
//

import UIKit

class HintsViewController: UIViewController {
    var hints2: [String] = []
    @IBOutlet weak var hints: UILabel!
    var index = 0
    @IBAction func next(_ sender: Any) {
        performSegue(withIdentifier: "back2", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hints.text = hints2[0] + "\n" + "\n" + "\n" + hints2[1]
   
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! RootViewController
        destinationVC.index = index
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

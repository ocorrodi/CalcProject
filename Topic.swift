//
//  Topic.swift
//  Calc Project
//
//  Created by Olivia Corrodi on 5/31/18.
//  Copyright © 2018 Olivia Corrodi. All rights reserved.
//

import UIKit

class Topic {
    let name: String
    let problems: [String : String]
    let hints: [String]
    let notes: String
    let image: String
    let answers: [String]
    
    init(name: String, problems: [String:String], hints: [String], notes: String, image: String, answers: [String]) {
        self.name = name
        self.problems = problems
        self.hints = hints
        self.notes = notes
        self.image = image
        self.answers = answers
    }
    

}

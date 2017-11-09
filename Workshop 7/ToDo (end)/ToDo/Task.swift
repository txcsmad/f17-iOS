//
//  Task.swift
//  ToDo
//
//  Created by Matthew Ruston on 10/25/17.
//  Copyright © 2017 MattRuston. All rights reserved.
//

import Foundation

struct Task {
    var text: String
    var isComplete: Bool
    
    init(text: String = "", isComplete: Bool = false) {
        self.text = text
        self.isComplete = isComplete
    }
}

//
//  TaskTableViewCell.swift
//  ToDo
//
//  Created by Matthew Ruston on 10/18/17.
//  Copyright © 2017 MattRuston. All rights reserved.
//

import UIKit

protocol TaskTableViewCellDelegate: class {
    func checkmarkTapped(sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    weak var delegate: TaskTableViewCellDelegate?
    
    var isComplete: Bool = false {
        didSet {
            if isComplete {
                button.setTitle("☑️", for: .normal)
            } else {
                button.setTitle("⬜️", for: .normal)
            }
        }
    }
    
    @IBAction func buttonTapped() {
        delegate?.checkmarkTapped(sender: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isComplete = false
        titleLabel.text = ""
        delegate = nil
    }
    
}



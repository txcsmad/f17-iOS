//
//  ViewController.swift
//  Light
//
//  Created by Jesse Tipton on 9/13/17.
//  Copyright © 2017 Jesse Tipton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lightOn = false
    
    @IBOutlet weak var lightButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn = !lightOn
        updateUI()
    }

    func updateUI() {
        if lightOn {
            lightButton.setTitle("Off", for: .normal)
            view.backgroundColor = .white
        } else {
            lightButton.setTitle("On", for: .normal)
            view.backgroundColor = .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

}

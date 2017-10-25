//
//  ListViewController.swift
//  ToDo
//
//  Created by Matthew Ruston on 10/18/17.
//  Copyright © 2017 MattRuston. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let tasks: [String] = ["Eat Food", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Party", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep", "Do Project", "Sleep"]
    
    private let cellId = "taskCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TaskTableViewCell", bundle: .main), forCellReuseIdentifier: cellId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskTableViewCell
        
        cell.titleLabel.text = tasks[indexPath.row]
        
        return cell
    }
}
















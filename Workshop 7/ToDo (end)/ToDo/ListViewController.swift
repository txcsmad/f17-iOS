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
    
    private var tasks: [Task] = [Task(text: "Sleep", isComplete: true), Task(text: "Sleep"), Task(text: "Sleep"), Task(text: "Sleep"), Task(text: "Sleep"), Task(text: "Hike"), Task(text: "Study"), Task(text: "Eat"), Task(text: "Play"), Task(text: "Sleep"), Task(text: "Hike"), Task(text: "Study"), Task(text: "Eat"), Task(text: "Play"), Task(text: "Sleep"), Task(text: "Hike"), Task(text: "Study"), Task(text: "Eat"), Task(text: "Play"), Task(text: "Sleep"), Task(text: "Hike"), Task(text: "Study"), Task(text: "Eat"), Task(text: "Play"), Task(text: "Sleep"), Task(text: "Hike"), Task(text: "Study"), Task(text: "Eat"), Task(text: "Play"), Task(text: "Sleep"), Task(text: "Hike"), Task(text: "Study"), Task(text: "Eat"), Task(text: "Play"), Task(text: "Sleep"), Task(text: "Hike"), Task(text: "Study"), Task(text: "Eat"), Task(text: "Play"), Task(text: "Sleep"), Task(text: "Hike"), Task(text: "Study"), Task(text: "Eat"), Task(text: "Play"), Task(text: "Sleep"), Task(text: "Hike"), Task(text: "Study"), Task(text: "Eat"), Task(text: "Play"), Task(text: "Sleep"), Task(text: "Hike"), Task(text: "Study"), Task(text: "Eat"), Task(text: "Play"), Task(text: "Sleep"), Task(text: "Hike"), Task(text: "Study"), Task(text: "Eat"), Task(text: "Play")]
    
    private let cellId = "taskCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TaskTableViewCell", bundle: .main), forCellReuseIdentifier: cellId)
    }
}


extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskTableViewCell
        
        let task = tasks[indexPath.row]
        cell.titleLabel.text = task.text
        cell.isComplete = task.isComplete
        cell.delegate = self
        
        return cell
    }
}


extension ListViewController: TaskTableViewCellDelegate {
    func checkmarkTapped(sender: TaskTableViewCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            tasks[indexPath.row].isComplete = !tasks[indexPath.row].isComplete
            sender.isComplete = tasks[indexPath.row].isComplete
        }
    }
}













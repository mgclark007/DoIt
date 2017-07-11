//
//  TasksViewController.swift
//  DoIt
//
//  Created by Alan Clark on 7/5/17.
//  Copyright © 2017 Matthew Clark. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var tasks: [Task] = []
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = Task.createTasks()
        
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if(task.important) {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = "🔆\(task.name)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        
        selectedIndex = indexPath.row
        
        let task = tasks[selectedIndex]
        performSegue(withIdentifier: "showTaskSegue", sender: task)
    }
    
    @IBAction func addTask(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addSegue") {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        if(segue.identifier == "showTaskSegue") {
            let nextVC = segue.destination as! ViewTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


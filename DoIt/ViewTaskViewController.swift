//
//  ViewTaskViewController.swift
//  DoIt
//
//  Created by Alan Clark on 7/10/17.
//  Copyright © 2017 Matthew Clark. All rights reserved.
//

import UIKit

class ViewTaskViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var previousVC = TasksViewController()
    var task = Task()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var importance = ""
        if(task.important) {
            importance = "❗️"
        } else {
            importance = "🔆"
        }
        nameLabel.text = "\(importance)\(task.name)"
        descriptionLabel.text = task.description
    }
    
    @IBAction func completeTask(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableview.reloadData()
        navigationController!.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

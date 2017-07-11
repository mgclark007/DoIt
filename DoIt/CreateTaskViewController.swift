//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Alan Clark on 7/6/17.
//  Copyright © 2017 Matthew Clark. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTask(_ sender: Any) {
        // Create a Task from the outlet information
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = nameField.text!
        task.important = importantSwitch.isOn
        if(descriptionField.text! == "") {
            task.explanation = "No Description"
        } else {
            task.explanation = descriptionField.text!
        }
        delegate.saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

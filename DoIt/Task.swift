//
//  Task.swift
//  DoIt
//
//  Created by Alan Clark on 7/5/17.
//  Copyright © 2017 Matthew Clark. All rights reserved.
//

import Foundation

class Task {
    
    var name = ""
    var description = ""
    var important = false
    
    static func createTasks() -> [Task] {
        let task1 = Task()
        task1.name = "temp"
        task1.description = "temp again"
        task1.important = false
        
        let task2 = Task()
        task2.name = "temp2"
        task2.description = "temp again2"
        task2.important = true
        
        let task3 = Task()
        task3.name = "3temp"
        task3.description = "temp3 again"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    
}

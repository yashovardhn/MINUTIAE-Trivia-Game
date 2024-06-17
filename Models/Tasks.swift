//
//  File.swift
//  TriviaGame
//
//  Created by Yashovardhn on 22/07/22.
//

import Foundation
 
public struct TaskModelDetails {
    var taskDetails: String
 
    init(taskDetails: String){
        self.taskDetails = taskDetails
    }
}
 
class TaskModel {
    var task: TaskModelDetails
     
    init(task: TaskModelDetails) {
        self.task = TaskModelDetails(taskDetails: task.taskDetails)
    }
}

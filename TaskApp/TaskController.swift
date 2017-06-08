//
//  TaskController.swift
//  TaskApp
//
//  Created by Nick Reichard on 6/7/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let shared = TaskController()
    
    // MARK: Properties
    
    var tasks: [Task] = []
    
    init() {
       tasks = fetchTasks()
    }
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due as NSDate?
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    
    func remove(task: Task) {
        task.managedObjectContext?.delete(task)
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    
    private func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch  {
            print("There was an error savign. \(error.localizedDescription)")
        }
    }
    
    private func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
//        return mockTests
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    // MARK: Mock Data
    
//    var mockTests: [Task] {
//        return [Task(name: "Task1"),
//                Task(name: "Task2"),
//                Task(name: "Task3"),
//                Task(name: "Task4")]
//    }
}

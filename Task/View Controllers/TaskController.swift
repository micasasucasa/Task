//
//  TaskController.swift
//  Task
//
//  Created by micasasucasa on 1/30/19.
//  Copyright © 2019 Jacob Rosevear. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
   
    static let shared = TaskController()
    //var tasks: [Task] = []
    
    
    
    let fetchedResultsController: NSFetchedResultsController<Task> = {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let isCompleteSort = NSSortDescriptor(key: "isComplete", ascending: false)
        let dueSort = NSSortDescriptor(key: "due", ascending: false).self
        fetchRequest.sortDescriptors = [isCompleteSort, dueSort]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isComplete", cacheName: nil)
        
    }()
    
    //init()
    var tasks: [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do{
            try fetchedResultsController.performFetch()
        }catch{
            print("Error loading fetched results from persistent store \(error) : \(error.localizedDescription)")
        }
            return []
    }
       // tasks = fetchTasks()
  //  }
    func add(taskWithName name: String, notes: String?, due: Date?) {
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
 //       tasks = fetchTasks()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due as Date?
        saveToPersistentStore()
  //      tasks = fetchTasks()
    }
    
    func remove(task: Task) {
        task.managedObjectContext?.delete(task)
        saveToPersistentStore()
 //       tasks = fetchTasks()
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    // MARK: Persistence
    
     func saveToPersistentStore() {
        
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
    
//     func fetchTasks() -> [Task] {
//        let request: NSFetchRequest<Task> = Task.fetchRequest()
//        return (try? CoreDataStack.context.fetch(request)) ?? []
//    }
    
    
//    func fetchTasks() -> [Task]{
//        return mockTasks
//    }
    
//    var mockTasks: [Task] = [
//        Task(name:"Task1", notes: "Notes1", due: Date()),
//        Task(name:"Task2", notes: "Notes2"),
//        Task(name:"Task3", notes: "Notes3", due: Date(), isComplete: true)]
//
}


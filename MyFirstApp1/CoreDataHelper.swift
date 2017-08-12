//
//  CoreDataHelper.swift
//  MyFirstApp1
//
//  Created by Abdulrahman Althobaiti on 8/9/17.
//  Copyright © 2017 Abdulrahman Althobaiti. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct CoreDataHelper {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    static func save() {        //(saves certain object to the default core data)
        do {
            try managedContext.save()
            //catches the error while trying to save
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    static func newList() -> List {
        let list = NSEntityDescription.insertNewObject(forEntityName: "List", into: managedContext) as! List
        return list
    }
    //Creating a new list
    
    static func newTask() -> Task {
        let task = NSEntityDescription.insertNewObject(forEntityName: "Task", into: managedContext) as! Task
        return task
    }

    
    static func delete(list: List) {
        managedContext.delete(list)
        save()
    }
    
    static func delete(task: Task) {
        managedContext.delete(task)
        save()
    }
    


static func retrieveLists() -> [List] {
    let fetchRequest = NSFetchRequest<List>(entityName: "List")
    do {
        let results = try managedContext.fetch(fetchRequest)
        return results
    }   catch let error as NSError {
        print("Could not fetch \(error)")
    }
    return []
}

    static func retrieveTasks() -> [Task] {
        let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        }   catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
}
    
    
    }

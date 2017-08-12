//
//  CoreDataHelper.swift
//  
//
//  Created by Abdulrahman Althobaiti on 8/9/17.
//
//

import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    //static methods will go here
    static func newlist() -> Note {
        let list = NSEntityDescription.insertNewObject(forEntityName: "List", into: managedContext) as! List
        return list
    }
    static func saveList() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    static func delete(note: List) {
        managedContext.delete(list)
        saveList()
    }
    static func retrieveLists() -> [List] {
        let fetchRequest = NSFetchRequest<List>(entityName: "List")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }
}

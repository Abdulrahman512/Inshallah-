//
//  ListTableViewController.swift
//  MyFirstApp1
//
//  Created by Abdulrahman Althobaiti on 7/19/17.
//  Copyright © 2017 Abdulrahman Althobaiti. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController, UITextFieldDelegate {
    // should be Task Table View contoller
    
    var list : List?
    
    var tasksArrayFromTasksSet = [Task]()
    
    
    required init?(coder aDecoder: NSCoder) {
        

        super.init(coder: aDecoder)
        print("Documents folder is \(documentsDirectory())")
        print("Data file path is \(dataFilePath())")
    
    }
    //    //Each row gets its own List object that you store in its own instance variable.
    //The init method is called by Swift when the object comes into existence.
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tasks = CoreDataHelper.retrieveTasks()
        
        tasksArrayFromTasksSet = CoreDataHelper.retrieveTasks()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tasksArrayFromTasksSet = list?.tasks?.allObjects as! [Task]
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tasksArrayFromTasksSet.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasksArrayFromTasksSet.count
        //(numberOfRowsInSection) It asks for the number of rows in a particular section of a particular table view.
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.lbl.text = tasksArrayFromTasksSet[indexPath.row].name
        
        return cell
        
    }
    // to obtain a cell for that row. This method grabs a copy of the prototype cell and gives that back to the table view, again with a return statement.
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    // the tableView(didSelectRowAt) method is one of the table view delegate methods and gets called whenever the user taps on a cell.
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            //1
            CoreDataHelper.delete(task: tasksArrayFromTasksSet[indexPath.row])
            //2
            tasksArrayFromTasksSet.remove(at: indexPath.row)
        
            tableView.reloadData()
        }
        
    }
    @IBAction func unwindToListViewController(_ segue: UIStoryboardSegue)  {
        self.tasksArrayFromTasksSet = CoreDataHelper.retrieveTasks()
    
    }
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        //getting full path to documents
        
    }
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Lists.plist")
    }
//    The dataFilePath() method uses documentsDirectory() to construct the full path to the file that will store the checklist items. This file is named Checklists.plist and it lives inside the Documents directory
    func ListOfTasks() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(tasksArrayFromTasksSet, forKey: "ListOfTasks")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TimeController {
            
            
            let row = tableView.indexPathForSelectedRow?.row
            destination.taskBox = tasksArrayFromTasksSet[row!]
            // here we are choosing the selected task into a task box
        }
        
    }
   // This method takes the contents of the items array and in two steps converts it to a block of binary data and then writes this data to a file
    //1. NSKeyedArchiver, which is a form of NSCoder that creates plist files, encodes the array and all the ChecklistItems in it into some sort of binary data format that can be written to a file.
   // 2. ThatdataisplacedinanNSMutableDataobject,whichwillwriteitselftothefile specified by dataFilePath().

}




//
//  ListTableViewController.swift
//  MyFirstApp1
//
//  Created by Abdulrahman Althobaiti on 7/19/17.
//  Copyright © 2017 Abdulrahman Althobaiti. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController, UITextFieldDelegate {
    
//    func addList(_ sender: Any) {
//        let addedRowIndex = lists.count
//        //I need to calculate what the index of the new row in my array should be.This is necessary in order to properly update the table view
//        
//        let Categorie = List()
//        //creates the new List object and adds it to the end of the array.
//        
//        Categorie.marked = false
//        Categorie.text = "new row bro"
//        
//        
//        Categorie.marked = false
//        lists.append(Categorie)
//        
//        let indexPath = IndexPath(row: addedRowIndex, section: 0)
//        //make an IndexPath object that points to the new row, using the row number from the addedRowIndex variable
//        let indexPaths = [indexPath]
//        //creates a new, temporary array holding just the one index-path item
//        tableView.insertRows(at: indexPaths, with: .automatic)
//        //telling the table view about the new row lets you insert multiple rows at the same time.
//    }
    
    var lists: [List]
    // This declares that lists will hold an array of List objects
    // but it does not actually create that array.
    // At this point, lists does not have a value yet.
    
    var tasks = [Task]()
    //  This instantiates the array. Now tasks contains a valid array object,
    // but the array has no Tasj objects inside it yet.

    
    required init?(coder aDecoder: NSCoder) {
        lists = [List]()
        //  This instantiates the array. Now Lists contains a valid array object,
        // but the array has no List objects inside it yet.
        
        super.init(coder: aDecoder)
    }
    //    //Each row gets its own List object that you store in its own instance variable.
    //The init method is called by Swift when the object comes into existence.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(tasks)
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
        //(numberOfRowsInSection) It asks for the number of rows in a particular section of a particular table view.
        
    }
    
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let currentCell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! NewCellTableView
    //
    //        currentCell.projectTitleLabel.text = lists[indexPath.row].name
    //
    // Configure the cell...
    //
    //        return currentCell
    //    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "list", for: indexPath) as! TaskCell
        
        cell.lbl.text = tasks[indexPath.row].name
        
        return cell
        
    }
    // to obtain a cell for that row. This method grabs a copy of the prototype cell and gives that back to the table view, again with a return statement.
    
    // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // let nextController = segue.destination as! TaskTableViewController
    
    //     let tappedList = lists[(tableView.indexPathForSelectedRow?.row)!]
    
    
    
    //nextController.tasks = tappedList.tasks
    
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //
    //        if editingStyle == UITableViewCellEditingStyle.delete
    //        {
    //
    //            self.lists.remove(at: indexPath.row)
    //            tableView.reloadData()
    //        }
    //
    //    }
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
            
            self.tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
    }
    @IBAction func unwindToListViewController(_ segue: UIStoryboardSegue){
        
    }

    
}




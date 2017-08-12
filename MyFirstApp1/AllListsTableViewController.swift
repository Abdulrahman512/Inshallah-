//
//  AllListsTableViewController.swift
//  MyFirstApp1
//
//  Created by Abdulrahman Althobaiti on 8/8/17.
//  Copyright © 2017 Abdulrahman Althobaiti. All rights reserved.
//

import UIKit

class AllListsTableViewController: UITableViewController {
  
    
    var lists = [List]()
    override func viewDidLoad() {
        super.viewDidLoad()
     lists = CoreDataHelper.retrieveLists()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    @IBAction func addButtonhit(_ sender: Any) {
        
        //This creates the box for the alert controller
        let alertController = UIAlertController(title: "Add A New List", message: "This is where you add a new List", preferredStyle: .alert)
        
        //this creates a save button and tells it what to do when tapped
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
            alert -> Void in
            
            
            let textField = alertController.textFields![0] as UITextField
            
            if let theText = textField.text, theText != ""{
                //If they typed stuff into the text field
                let newList = CoreDataHelper.newList()
                newList.name = theText
                self.lists.append(newList)
                CoreDataHelper.save()
                
                self.tableView.reloadData()
            
            }
            else{
                //If they didn't type stuff into the text field
                print("You didn't input anything")
            }
            
            
            
        })
        
        // this creates a cancel button and tells it what to do when tapped
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { alert -> Void in
            print("Canceled")
            
        })
        
        //this adds a text field to the alert controller
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Your List"
        }
        
        //these two lines add the buttons to the alert controller
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        
        
        //this shows the alert controller to the user
        self.present(alertController, animated: true, completion: nil)
        
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = makeCell(for: tableView)
        cell.textLabel?.text = lists[indexPath.row].name
        return cell
        
        //create the cells in code
        
    }
    
   
    func makeCell(for tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "Cell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell }
        else {
            return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        //// for us to creat cells in code it requires helper methode 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowTasks", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ListTableViewController {
            
            
            let row = tableView.indexPathForSelectedRow?.row
            destination.list = lists[row!]
            self.lists = CoreDataHelper.retrieveLists()
            // here we are choosing the selected task into a task box
        }
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            //deletes certain Subject in row.
            CoreDataHelper.delete(list: lists[indexPath.row])
            // need to remove count and take out the colored view
            //cell.numberTopics?.text = "Topics: " + String(unwrappedTopics.count -= 1)
            CoreDataHelper.save()
            lists.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}





//
//  ViewController.swift
//  newList
//
//  Created by Toby Lewkowicz on 3/24/16.
//  Copyright © 2016 Toby Lewkowicz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    var toDoItems = [ToDoItem]()
    var managedContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        let fetchRequest = NSFetchRequest(entityName: "ToDoItem")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            toDoItems = results as! [ToDoItem]
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("toDoCell")
        cell?.textLabel?.text = toDoItems[indexPath.row].valueForKey("name") as? String
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .ShortStyle
        
        cell?.detailTextLabel?.text = dateFormatter.stringFromDate(toDoItems[indexPath.row].dateAdded!)
        
        if toDoItems[indexPath.row].isDone == true {
        cell?.accessoryType = .Checkmark
        } else {
            cell?.accessoryType = .None
        }
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        toDoItems[indexPath.row].isDone = !toDoItems[indexPath.row].isDone!.boolValue
        
        do {
            try managedContext.save()
            tableView.reloadData()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func addItem(sender: AnyObject) {
        let alert = UIAlertController(title: "New Item", message: "What's up?", preferredStyle: .Alert)
        
        let save = UIAlertAction(title: "Save", style: .Default) {
            (action: UIAlertAction) -> Void in
            
            let textField = alert.textFields!.first
            
            let entity = NSEntityDescription.entityForName("ToDoItem", inManagedObjectContext: self.managedContext)
            let item = ToDoItem(entity: entity!, insertIntoManagedObjectContext: self.managedContext)
            
            
            item.name = textField!.text!
            item.dateAdded = NSDate()
            item.isDone = false
            
            
            
            do {
                try self.managedContext.save()
                self.toDoItems.append(item)
            } catch let error as NSError {
                print(error.description)
            }
            
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Default) {
            (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler() {
            (UITextField) -> Void in
        }
        
        alert.addAction(save)
        alert.addAction(cancel)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
}



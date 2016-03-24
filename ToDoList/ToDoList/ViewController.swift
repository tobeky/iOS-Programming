//
//  ViewController.swift
//  ToDoList
//
//  Created by Toby Lewkowicz on 3/21/16.
//  Copyright © 2016 Toby Lewkowicz. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var toDoItems = [String]()
    
    @IBAction func addItem(sender: AnyObject) {
        let alert = UIAlertController(title: "New Item", message: "What's up?", preferredStyle: .Alert)
        
        let save = UIAlertAction(title: "Save", style: .Default) {
            (action: UIAlertAction) -> Void In
            
            let textField = alert.textFields!.first
            self.toDoItems
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


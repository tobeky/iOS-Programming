//
//  ToDoItem+CoreDataProperties.swift
//  newList
//
//  Created by Toby Lewkowicz on 3/24/16.
//  Copyright © 2016 Toby Lewkowicz. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ToDoItem {

    @NSManaged var name: String?
    @NSManaged var dateAdded: NSDate?
    @NSManaged var isDone: NSNumber?

}

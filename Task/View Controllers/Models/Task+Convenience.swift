//
//  Task+Convenience.swift
//  Task
//
//  Created by micasasucasa on 1/30/19.
//  Copyright © 2019 Jacob Rosevear. All rights reserved.
//

import Foundation
import CoreData
extension Task {
    @discardableResult
    convenience init(name: String, notes: String? = nil, due: Date? = nil, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
    self.init(context: context)
    self.name = name
    self.notes = notes
    self.due = due as Date?
    self.isComplete = isComplete
    
    }
}

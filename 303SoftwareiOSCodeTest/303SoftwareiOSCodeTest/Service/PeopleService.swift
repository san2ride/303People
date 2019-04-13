//
//  PeopleService.swift
//  303SoftwareiOSCodeTest
//
//  Created by Jason Sanchez on 4/12/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation
import CoreData

class PeopleService {
    static func getPeople(moc: NSManagedObjectContext) -> NSFetchedResultsController<People> {
        let fetchedResultController: NSFetchedResultsController<People>
        
        let request: NSFetchRequest<People> = People.fetchRequest()
        let nameSort = NSSortDescriptor(key: "lname", ascending: true)
        
        request.sortDescriptors = [nameSort]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: request,
                                                             managedObjectContext: moc,
                                                             sectionNameKeyPath: nil,
                                                             cacheName: nil)
        do {
            try fetchedResultController.performFetch()
        }
        catch {
            fatalError("error in fetching records")
        }
        return fetchedResultController
    }
}

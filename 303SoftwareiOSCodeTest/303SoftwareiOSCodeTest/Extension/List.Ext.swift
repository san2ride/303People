//
//  List.Ext.swift
//  303SoftwareiOSCodeTest
//
//  Created by Jason Sanchez on 4/12/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation
import CoreData

extension People {
    func searchData(for people: People, moc: NSManagedObjectContext) -> [People] {
        let searchRequest: NSFetchRequest<People> = People.fetchRequest()
        searchRequest.predicate = NSPredicate(format: "people = %@", people)

        do {
            let people = try moc.fetch(searchRequest)
            return people
        }
        catch {
            fatalError("could not fetch data")
        }
    }
}

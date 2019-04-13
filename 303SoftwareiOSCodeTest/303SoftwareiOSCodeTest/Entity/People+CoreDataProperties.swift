//
//  People+CoreDataProperties.swift
//  303SoftwareiOSCodeTest
//
//  Created by Jason Sanchez on 4/12/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//
//

import Foundation
import CoreData


extension People {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<People> {
        return NSFetchRequest<People>(entityName: "People")
    }

    @NSManaged public var fname: String?
    @NSManaged public var lname: String?
    @NSManaged public var city: String?

}

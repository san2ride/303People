//
//  AppDelegate.swift
//  303SoftwareiOSCodeTest
//
//  Created by Jason Sanchez on 4/12/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coreData = CoreDataStack()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        checkData()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {
        coreData.saveContext()
    }

    //MARK: Private
    private func checkData() {
        let request: NSFetchRequest<People> = People.fetchRequest()
        let moc = coreData.persistentContainer.viewContext
        
        if let peopleCount = try? moc.count(for: request), peopleCount > 0 {
            return
        }
        uploadSampleData()
    }
    
    //MARK: json data
    func uploadSampleData() {
        let moc = coreData.persistentContainer.viewContext

        guard
            let url = Bundle.main.url(forResource: "people", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary,
            let jsonArray = jsonResult?.value(forKey: "people") as? NSArray

        else { return }

        for json in jsonArray {
            guard
                let peopleData = json as? [String : AnyObject],
                let lname      = peopleData["lname"] as? String,
                let fname      = peopleData["fname"] as? String,
                let city       = peopleData["city"] as? String
            else { return }

            let people = People(context: moc)
            people.lname = lname
            people.fname = fname
            people.city  = city

//            if let fname = peopleData["fname"], people.isKind(of: People.self) {
//                (people as People).fname = fname.string
//            }
//
//            if let lname = peopleData["lname"], people.isKind(of: People.self) {
//                (people as People).lname = lname.string
//            }
//
//            if let city = peopleData["city"], people.isKind(of: People.self) {
//                (people as People).city = city.string
//            }
        }
        coreData.saveContext()
    }
}


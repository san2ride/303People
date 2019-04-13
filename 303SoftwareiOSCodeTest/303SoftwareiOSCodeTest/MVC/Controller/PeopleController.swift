//
//  PeopleController.swift
//  303SoftwareiOSCodeTest
//
//  Created by Jason Sanchez on 4/12/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import UIKit
import CoreData
import RevealingSplashView

class PeopleController: UITableViewController {
    
    //MARK: Private Properties
    private var coreData = CoreDataStack()
    private var fetchedResultsController: NSFetchedResultsController<People>?
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "Software303")!,
                                                  iconInitialSize: CGSize(width: 80, height: 80),
                                                  backgroundColor: UIColor.white)

    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.heartBeat
        revealingSplashView.startAnimation()
        loadData()
        
        revealingSplashView.heartAttack = true

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = fetchedResultsController?.sections {
            return sections.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController?.sections {
            return sections[section].numberOfObjects
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as! PeopleCell
        
        if let currentPeople = fetchedResultsController?.object(at: indexPath) {
            cell.configureCell(people: currentPeople)
        }
        
        return cell
    }
    
    // MARK: Private
    private func loadData() {
        fetchedResultsController = PeopleService.getPeople(moc: coreData.persistentContainer.viewContext)
    }
}

extension PeopleController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}

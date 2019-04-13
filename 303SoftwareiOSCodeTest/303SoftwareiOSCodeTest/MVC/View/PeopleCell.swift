//
//  PeopleCell.swift
//  303SoftwareiOSCodeTest
//
//  Created by Jason Sanchez on 4/12/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import UIKit

class PeopleCell: UITableViewCell {

    @IBOutlet weak var fnameLabel: UILabel!
    @IBOutlet weak var lnameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    func configureCell(people: People) {
        fnameLabel.text = people.fname
        lnameLabel.text = people.lname
        cityLabel.text  = people.city
    }
}

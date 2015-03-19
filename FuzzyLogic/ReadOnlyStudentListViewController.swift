//
//  ReadOnlyStudentListViewController.swift
//  FuzzyLogic
//
//  Created by Victor Shamanov on 3/20/15.
//  Copyright (c) 2015 Victor Shamanov. All rights reserved.
//

import UIKit

class ReadOnlyStudentListViewController: UITableViewController {
    
    var students: [Student] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK:- Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdentifier = "Cell"
        
        let cell = (tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as? UITableViewCell) ?? UITableViewCell(style: .Default, reuseIdentifier: CellIdentifier)
        
        
        let student = students[indexPath.row]
        
        cell.textLabel?.text = "\(student.name) - \(student.points)"
        
        return cell
    }
    
}

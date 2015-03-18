//
//  MasterTableViewController.swift
//  FuzzyLogic
//
//  Created by Victor Shamanov on 3/18/15.
//  Copyright (c) 2015 Victor Shamanov. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    // MARK:- Type declaration
    
    private enum Row {
        case List
        case Request
        
        init?(fromIndexPath indexPath: NSIndexPath) {
            switch (indexPath.section, indexPath.row) {
                
            case (0, 0):
                self = .List
                
            case (0, 1):
                self = .Request
                
            default:
                return nil
            }
        }
        
        static var count: Int {
            return 2
        }
    }
    
    // MARK:- Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: CellIdentifier)
        
        switch Row(fromIndexPath: indexPath) {
            
        case .Some(.List):
            cell.textLabel?.text = "Student's List"
            
        case .Some(.Request):
            cell.textLabel?.text = "Requests"
            
        case .None:
            break
        }
        
        return cell
    }
    
    // MARK:- Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch Row(fromIndexPath: indexPath) {
        case .Some(.List):
            
            let studentListViewController = storyboard?.instantiateViewControllerWithIdentifier("StudentListViewController") as StudentListViewController
            
            splitViewController?.showDetailViewController(studentListViewController, sender: nil)
            
        case .Some(.Request):
            break
            
        case .None:
            break
        }
    }
    
}

//
//  StudentListViewController.swift
//  FuzzyLogic
//
//  Created by Victor Shamanov on 3/18/15.
//  Copyright (c) 2015 Victor Shamanov. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController, UITableViewDataSource {
    
    // MARK:- Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- Public properties
    
    var studentsManager: StudentsManager!
    
    // MARK:- Private properties
    
    var students: [Student] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK:- View controller's overridings

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadStudents()
    }
    
    // MARK:- Actions
    
    @IBAction func didFinishEditing(sender: UITextField) {
        if let (name, points) = validateText(sender.text) {
            addStudent(name, points: points)
            sender.text = ""
        } else {
            let alert = UIAlertController(title: "Invalid data", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    // MARK:- Private methods
    
    private func validateText(text: String) -> (name: String, points: Double)? {
        
        let splitted = split(text) { $0 == " " }
        
        if splitted.count < 2 {
            return nil
        }
        
        let first = dropLast(splitted)
        let last: NSString = splitted.last!
        
        return (first.reduce("", combine: +), last.doubleValue)
    }
    
    private func reloadStudents() {
        studentsManager.getAllStudents().onComplete { self.students = $0 }
    }
    
    private func addStudent(name: String, points: Double) {
        studentsManager.addStudent(Student(name: name, points: points))
    }
    
    // MARK:- Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: CellIdentifier)
        
        
        let student = students[indexPath.row]
        
        cell.textLabel?.text = "\(student.name) - \(student.points)"
        
        return cell
    }
    
}

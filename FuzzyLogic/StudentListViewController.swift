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
    
    var studentManager: StudentsManager!
    
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
        
    }
    
    // MARK:- Private methods
    
    private func reloadStudents() {
        studentManager
            .getStrudents { _ in true }
            .onComplete { self.students = $0 }
    }
    
    private func addStudent(name: String, points: Double) {
        studentManager.addStudent(Student(name: name, points: points))
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

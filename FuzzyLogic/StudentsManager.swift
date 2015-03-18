//
//  StudentsManager.swift
//  FuzzyLogic
//
//  Created by Victor Shamanov on 3/18/15.
//  Copyright (c) 2015 Victor Shamanov. All rights reserved.
//

import Foundation
import PureFutures

class StudentsManager {
    
    // MARK:- Type declarations
    
    private typealias StudentDict = [NSObject:AnyObject]
    
    // MARK:- Private properties
    
    private let userDefaults: NSUserDefaults
    
    // MARK:- Initialization
    
    init(userDefaults: NSUserDefaults) {
        self.userDefaults = userDefaults
    }
    
    // MARK:- Public methods
    
    func addStudent(student: Student) {
        getAllStudentDictionaries().onComplete(dispatch_get_main_queue()) { dicts in
            self.userDefaults.setObject(dicts + [student.encode()], forKey: "students")
        }
    }
    
    func getAllStudents() -> Deferred<[Student]> {
        return getStudents { _ in true }
    }
    
    func getStudents(predicate: Student -> Bool) -> Deferred<[Student]> {
        return getAllStudentDictionaries().map { dicts in
            dicts.map(Student.decode).reduce([]) { acc, value in
                if let student = value {
                    return predicate(student) ? acc + [student] : acc
                } else {
                    return acc
                }
            }
        }
    }
    
    // MARK:- Private methods
    
    private func getAllStudentDictionaries() -> Deferred<[StudentDict]> {
        return deferred { self.userDefaults.objectForKey("students") as? [StudentDict] ?? [] }
    }
    
}

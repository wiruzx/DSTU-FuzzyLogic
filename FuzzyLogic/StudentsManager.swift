//
//  StudentsManager.swift
//  FuzzyLogic
//
//  Created by Victor Shamanov on 3/18/15.
//  Copyright (c) 2015 Victor Shamanov. All rights reserved.
//

import Foundation
import class PureFutures.Deferred
import struct PureFutures.PurePromise

class StudentsManager {
    
    private let database: YapDatabase
    
    init(database: YapDatabase) {
        self.database = database
    }
    
    func addStudent(student: Student) {
        
    }
    
    func getStrudents(predicate: Student -> Bool) -> Deferred<[Student]> {
        let p = PurePromise<[Student]>()
        
        return p.deferred
    }
    
}

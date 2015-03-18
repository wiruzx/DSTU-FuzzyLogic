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
    
    let userDefaults: NSUserDefaults
    
    init(userDefaults: NSUserDefaults) {
        self.userDefaults = userDefaults
    }
    
    func addStudent(student: Student) {
        
    }
    
    func getStrudents(predicate: Student -> Bool) -> Deferred<[Student]> {
        let p = PurePromise<[Student]>()
        
        return p.deferred
    }
    
}

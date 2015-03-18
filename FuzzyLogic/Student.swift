//
//  Student.swift
//  FuzzyLogic
//
//  Created by Victor Shamanov on 3/18/15.
//  Copyright (c) 2015 Victor Shamanov. All rights reserved.
//

import Foundation

struct Student {
    
    let name: String
    let points: Double
    
}

extension Student {
    
    func encode() -> [NSObject:AnyObject] {
        return [
            "name" : name,
            "points" : points
        ]
    }
    
    static func decode(dictionary: [NSObject:AnyObject]) -> Student? {
        
        let name = dictionary["name"] as? String
        let points = dictionary["points"] as? Double
        
        switch (name, points) {
            
        case let (.Some(name), .Some(points)):
            return Student(name: name, points: points)
            
        default:
            return nil
        }
    }
    
}

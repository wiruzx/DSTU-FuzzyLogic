//
//  QueryFunctions.swift
//  FuzzyLogic
//
//  Created by Victor Shamanov on 3/18/15.
//  Copyright (c) 2015 Victor Shamanov. All rights reserved.
//

import Foundation

func five(value: Double) -> Double {
    return (80 - value) / 10
}

func four(value: Double) -> Double {
    switch value {
    case let x where x < 70:
        return (60 - x) / 10
    case let x where x >= 70 && x <= 80:
        return 1
    default:
        return (90 - value) / 10
    }
}

func three(value: Double) -> Double {
    switch value {
    case let x where x < 40:
        return (x - 30) / 10
    case let x where x >= 40 && x <= 60:
        return 1
    default:
        return (70 - value) / 10
    }
}

func two(value: Double) -> Double {
    return (40 - value) / 10
}

//
//  QueryFunctions.swift
//  FuzzyLogic
//
//  Created by Victor Shamanov on 3/18/15.
//  Copyright (c) 2015 Victor Shamanov. All rights reserved.
//

import Foundation

func five(value: Double) -> Double {
    switch value {
    case let x where x > 80 && x <= 100:
        return (x - 80) / 10
    default:
        return 0
    }
}

func four(value: Double) -> Double {
    switch value {
    case let x where x >= 60 && x < 70:
        return (x - 60) / 10
    case let x where x >= 70 && x <= 80:
        return 1
    case let x where x > 80 && x < 90:
        return (90 - x) / 10
    default:
        return 0
    }
}

func three(value: Double) -> Double {
    switch value {
    case let x where x >= 30 && x < 40:
        return (x - 30) / 10
    case let x where x >= 40 && x <= 60:
        return 1
    case let x where x > 60 && x < 70:
        return (70 - x) / 10
    default:
        return 0
    }
}

func two(value: Double) -> Double {
    switch value {
    case let x where x >= 0 && x < 40:
        return (40 - x) / 10
    default:
        return 0
    }
}

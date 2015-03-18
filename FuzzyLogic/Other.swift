//
//  Other.swift
//  FuzzyLogic
//
//  Created by Victor Shamanov on 3/18/15.
//  Copyright (c) 2015 Victor Shamanov. All rights reserved.
//

import Foundation

func run<T>(block: () -> T) -> T {
    return block()
}

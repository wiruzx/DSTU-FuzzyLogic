//
//  GroupSelectViewController.swift
//  FuzzyLogic
//
//  Created by Victor Shamanov on 3/18/15.
//  Copyright (c) 2015 Victor Shamanov. All rights reserved.
//

import UIKit

private let verticalScale = 1.2 / Double(numberOfVerticalTicks)
private let horizontalScale = 100.0 / Double(numberOfHorizontalTicks)

private let numberOfVerticalTicks: Int32 = 6
private let numberOfHorizontalTicks: Int32 = 10

class GroupSelectViewController: UIViewController {
    
    // MARK:- Type declarations
    
    private enum Grade: Int {
        case Five, Four, Three, Two
    }
    
    private enum Operator: Int {
        case Or, And
    }
    
    // MARK:- Private properties
    
    private var onceToken: dispatch_once_t = 0
    
    // MARK:- Public properties
    
    var studentsManager: StudentsManager!
    
    // MARK:- Outlets
    
    @IBOutlet private weak var gradesSegmentControl: UISegmentedControl!
    @IBOutlet private weak var operatorSegmentControl: UISegmentedControl!
    @IBOutlet private weak var notGradesSegmentControl: UISegmentedControl!
    @IBOutlet private weak var chartView: LineChart!
    
    // MARK:- View controller's overridings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLineChartView()
        updateGraphForCurrentState()
    }
    
    // MARK:- Actions
    
    @IBAction private func segmentControlValueChanged(sender: UISegmentedControl) {
        updateGraphForCurrentState()
    }
    
    @IBAction private func nextButtonPressed(sender: AnyObject) {
    }
    
    // MARK:- Private methods
    
    private func updateGraphForCurrentState() {
        let grade = gradeFromSegment(gradesSegmentControl) ?? .Five
        let notGrade = gradeFromSegment(notGradesSegmentControl) ?? .Five
        let op = operatorFromSegment(operatorSegmentControl) ?? .Or
        
        updateGraph(grade, notGrade: notGrade, op: op)
    }
    
    private func updateGraph(grade: Grade, notGrade: Grade, op: Operator) {
        
        let staticLine = Array(count: 11, repeatedValue: CGFloat(0.8))
        
        let gradeFunction = functionFromGrade(grade)
        let notGradeFunction = { 1 - self.functionFromGrade(notGrade)($0) }
        
        let line = Array(0...10).map { Double($0 * 10) }
        
        let firstLine = line.map(gradeFunction).map(toCGFloat)
        let secondLine = line.map(notGradeFunction).map(toCGFloat)
        
        chartView.clearAll()
        
        chartView.addLine(firstLine)
        chartView.addLine(secondLine)
        chartView.addLine(staticLine)
        
    }
    
    private func functionFromGrade(grade: Grade) -> Double -> Double {
        
        let f: Double -> Double
        
        switch grade {
        case .Five:
            f = five
        case .Four:
            f = four
        case .Three:
            f = three
        case .Two:
            f = two
        }
        
        return constrain(f)
    }
    
    // MARK:- Helper methods
    
    private func constrain(f: Double -> Double)(value: Double) -> Double {
        return min(max(0, f(value)), 1)
    }
    
    private func toCGFloat(doubleValue: Double) -> CGFloat {
        return CGFloat(doubleValue)
    }
    
    private func configureLineChartView() {
        
        chartView.area = false
        chartView.x.grid.count = 11
        chartView.y.grid.count = 6
        chartView.x.labels.values = Array(0...10).map { "\($0 * 10)" }
    }
    
    private func operatorFromSegment(segment: UISegmentedControl) -> Operator? {
        return segment.numberOfSegments == 2 ? Operator(rawValue: segment.selectedSegmentIndex) : nil
    }
    
    private func gradeFromSegment(segment: UISegmentedControl) -> Grade? {
        return segment.numberOfSegments == 4 ? Grade(rawValue: segment.selectedSegmentIndex) : nil
    }
    
}

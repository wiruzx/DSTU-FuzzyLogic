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
    @IBOutlet private weak var containerView: UIView!
    
    // MARK:- View controller's overridings
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        dispatch_once(&onceToken) {
            
            let containerSize = self.containerView.frame.size
            
        }
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
        
    }
    
    // MARK:- Helper methods
    
    private func operatorFromSegment(segment: UISegmentedControl) -> Operator? {
        return segment.numberOfSegments == 2 ? Operator(rawValue: segment.selectedSegmentIndex) : nil
    }
    
    private func gradeFromSegment(segment: UISegmentedControl) -> Grade? {
        return segment.numberOfSegments == 4 ? Grade(rawValue: segment.selectedSegmentIndex) : nil
    }
    
}

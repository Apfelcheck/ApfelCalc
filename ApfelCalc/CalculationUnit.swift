//
//  CalculationUnit.swift
//  ApfelCalc
//
//  Created by Waldemar Cichon on 23.02.15.
//  Copyright (c) 2015 Apfelcheck. All rights reserved.
//

import Foundation

class CalculationUnit {
    let displayController: DisplayController
    
    var stack = [Double]()
    
    init(_displayController: DisplayController) {
        displayController = _displayController
    }
    
    func push(number: Double) {
        stack.append(number);
    }
    
    func pop() -> Double {
        if (stack.count == 0) {
            return 0;
        }
        return stack.removeLast()
    }
    
    func enterKeyPressed() {
    }
    
    func plusKeyPressed() {
    }

    func minusKeyPressed() {
    }
    
    func multiplyKeyPressed() {
    }

    func divideKeyPressed() {
    }
}

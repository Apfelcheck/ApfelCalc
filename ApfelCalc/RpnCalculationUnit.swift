//
//  RpnCalculationUnit.swift
//  ApfelCalc
//
//  Created by Waldemar Cichon on 02.03.15.
//  Copyright (c) 2015 Apfelcheck. All rights reserved.
//

import Foundation

class RpnCalculationUnit : CalculationUnit {
    
    
    override func enterKeyPressed() {
        push (displayController.Value)
        displayController.Value = displayController.Value
    }
    
    override func plusKeyPressed() {
        var x = displayController.Value + pop()
        displayController.Value = x
    }
    
    override func minusKeyPressed() {
        var x = pop() - displayController.Value
        displayController.Value = x
    }
    
    override func multiplyKeyPressed() {
        var x = displayController.Value * pop()
        displayController.Value = x
    }
    
    override func divideKeyPressed() {
        var x = pop() - displayController.Value
        displayController.Value = x
    }

}

//
//  StandardCalculationUnit.swift
//  ApfelCalc
//
//  Created by Waldemar Cichon on 02.03.15.
//  Copyright (c) 2015 Apfelcheck. All rights reserved.
//

import Foundation

class StandardCalculationUnit : CalculationUnit {
    
    var lastOperation : MathOperations = .None
    
    override init(_displayController: DisplayController) {
        super.init(_displayController: _displayController)
    }

    
    override func enterKeyPressed() {
        resolve(.None);
    }
    
    override func plusKeyPressed() {
        resolve(.Plus)
    }
    
    override func minusKeyPressed() {
        resolve(.Minus)
    }
    
    override func multiplyKeyPressed() {
        resolve(.Multiplication)
    }
    
    override func divideKeyPressed() {
        resolve(.Division)
    }
    
    func resolve(operation : MathOperations) {
        var x: Double = displayController.Value
        
        if (operation != .None) {
            push(displayController.Value)
        }
        
        switch (lastOperation) {
            case .None : break
            case .Plus : x = plus(); break
            case .Minus: x = minus(); break
            case .Multiplication: x = multiply(); break;
            case .Division: x = divide(); break;
        }
        
        if (lastOperation == .None && operation == .None) {
            return
        }
        
        lastOperation = operation;
        
        displayController.Value = x
    }
    
    func plus() -> Double {
        return displayController.Value + pop()
    }
    
    func minus() -> Double {
        return pop() - displayController.Value
    }
    
    func multiply() -> Double {
        return displayController.Value * pop()
    }
    
    func divide() -> Double {
        return pop() / displayController.Value
    }
}
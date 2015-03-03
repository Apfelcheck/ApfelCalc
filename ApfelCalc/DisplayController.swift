//
//  DisplayController.swift
//  ApfelCalc
//
//  Created by Waldemar Cichon on 16.02.15.
//  Copyright (c) 2015 Apfelcheck. All rights reserved.
//

import UIKit

class DisplayController {
    let maximalCiphers = 10
    let displayTextField : UITextField
    
    var currentCipherCount = 0
    var commaInserted = false
    var negative = false
    var shouldClearNext = false
    
    init(_displayTextField : UITextField) {
        displayTextField = _displayTextField
    }
    
    // will add a cipher corresponding to a pressed key
    func cipherKeyPressed(cipher : Int8) {
        clearIfNecessary()
        if (currentCipherCount >= maximalCiphers) {
            return;
        }
        
        var displayedText: String = displayTextField.text;
        if (displayedText == "0") {
            displayedText = ""
        }
        
        displayedText += String(cipher)
        displayTextField.text = displayedText;
        currentCipherCount++;
    }
    
    // method adds a comma to the displayed text
    func commaKeyPressed() {
        clearIfNecessary()
        if (commaInserted) {
            return;
        }
        var displayedText: String = displayTextField.text;
        displayedText += ".";
        displayTextField.text = displayedText;
        commaInserted = true;
    }
    
    // method changes the sign of the displayed number
    func chsKeyPressed() {
        var displayedText: String = displayTextField.text;
        
        // do not change sign if the display is empty
        if (displayedText == "0") {
            return;
        }
        
        displayedText = negative ? displayedText.substringFromIndex(advance(displayedText.startIndex, 1)) : "-" + displayedText
        displayTextField.text = displayedText
        
        negative = !negative;
    }
    
    var Value: Double {
        get {
            var displayedText: String = displayTextField.text
            return strtod(displayedText, nil)
        }
        
        set(newValue) {
            let displayedText = NSString(format: "%f", newValue)
            displayTextField.text = displayedText
            shouldClearNext = true
        }
    }
    
    func clearIfNecessary() {
        if (shouldClearNext) {
            clear();
        }
    }
    
    func clear() {
        shouldClearNext = false;
        displayTextField.text = "0"
        negative = false
        currentCipherCount = 0;
    }
}
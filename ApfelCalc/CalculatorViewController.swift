//
//  CalculatorViewController.swift
//  ApfelCalc
//
//  Controls the function of the main calculator window
//
//  Created by Waldemar Cichon on 09.02.15.
//  Copyright (c) 2015 Apfelcheck. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {


    @IBOutlet var displayTextField: UITextField!
    @IBOutlet var enterKey: UIButton!
    
    var displayController: DisplayController?
    var currentCalculationUnit: CalculationUnit?
    
    let enterKeyLabels = ["=", "E\nN\nT\nE\nR"]
    var calculationUnits: [CalculationUnit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayController = DisplayController(_displayTextField: displayTextField)
        calculationUnits = [
            StandardCalculationUnit(_displayController: displayController!),
            RpnCalculationUnit(_displayController: displayController!)
        ]
        currentCalculationUnit = calculationUnits[0]
        enterKey.setTitle(enterKeyLabels[0], forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cipherButtonClicked(sender: UIButton) {
        displayController!.cipherKeyPressed(Int8(sender.tag))
    }

    @IBAction func commaButtonClicked() {
        displayController!.commaKeyPressed()
    }

    @IBAction func chsButtonClicked() {
        displayController!.chsKeyPressed()
    }
    
    @IBAction func enterButtonClicked() {
        currentCalculationUnit!.enterKeyPressed()
    }
    
    @IBAction func plusButtonClicked() {
        currentCalculationUnit!.plusKeyPressed()
    }
    
    @IBAction func minusButtonClicked() {
        currentCalculationUnit!.minusKeyPressed()
    }
    
    @IBAction func multiplyButtonClicked() {
        currentCalculationUnit!.multiplyKeyPressed()
    }
    
    @IBAction func divideButtonClicked() {
        currentCalculationUnit!.divideKeyPressed()
    }
    
    @IBAction func modeControlValueChanged(sender: UISegmentedControl) {
        var title = enterKeyLabels[sender.selectedSegmentIndex]
        self.enterKey.setTitle(title, forState: UIControlState.Normal)
        self.currentCalculationUnit = calculationUnits[sender.selectedSegmentIndex]
    }

    
    
}


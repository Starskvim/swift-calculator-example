//
//  ViewController.swift
//  swift-calculator-example
//
//  Created by Михаил Гайволя on 26.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet 
    weak var label: UILabel!
    
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    var dotIsPlaced = false
    
    var currentInput: Double {
        get {
            return Double(label.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                label.text = "\(valueArray[0])"
            } else {
                label.text = "\(newValue)"
            }
            stillTyping = false
        }
    }
    
    @IBAction 
    func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle
        print(number as Any)
        if stillTyping {
            if (label.text?.count)! < 20 {
                label.text = label.text! + number!
            }
        } else {
            label.text = number
            stillTyping = true
        }
    }
    
    @IBAction 
    func twoOpSignPressed(_ sender: UIButton) {
        print(sender.currentTitle as Any)
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        print(firstOperand)
        stillTyping = false
        dotIsPlaced = false
    }
    
    @IBAction 
    func eqSignPress(_ sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        dotIsPlaced = false
        switch operationSign {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "×":
            operateWithTwoOperands{$0 * $1}
        case "÷":
            operateWithTwoOperands{$0 / $1}
        default : break
        }
    }
    
    
    @IBAction 
    func clearButtonPress(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        label.text = "0"
        stillTyping = false
        operationSign = ""
        dotIsPlaced = false
    }
    
    @IBAction 
    func plusMinusPress(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction 
    func percentageButtonPress(_ sender: UIButton) {
        if (firstOperand == 0) {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
        stillTyping = false
    }
    
    @IBAction 
    func squareButtonPress(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    
    
    @IBAction 
    func dotButtonPress(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced {
            label.text = label.text! + "."
            dotIsPlaced = true
        } else if !stillTyping && !dotIsPlaced {
            label.text = "0."
        }
    }
    
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
}

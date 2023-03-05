//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Pino Omodei on 04/03/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi : BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let value = weight / pow(height, 2)
        
        if (value < 18.5) {
            bmi = BMI(value: value, advice: "Eat more, you are underweight!", color: UIColor.blue)
        } else if (value < 24.9) {
            bmi = BMI(value: value, advice: "Keep it up, you're in perfect shape!", color: UIColor.systemGreen)
        } else {
            bmi = BMI(value: value, advice: "Eat less, you are overweight!", color: UIColor.red)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getBMIAdvice() -> String {
        return bmi?.advice ?? "BMI not calculated, no advice"
    }
    
    func getBMIColor() -> UIColor {
        return bmi?.color ?? UIColor.gray
    }

}

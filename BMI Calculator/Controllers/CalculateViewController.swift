//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit


class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        heightValueLabel.text = String(format: "%.2f", sender.value)+"m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightValueLabel.text = String(Int(sender.value))+"Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        // self.shouldPerformSegue(withIdentifier: "goToResult", sender: self)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if (segue.identifier == "goToResult") {
            let destination = segue.destination as! ResultViewController
            
            // Pass the selected object to the new view controller.
            destination.bmiValue = calculatorBrain.getBMIValue()
            destination.bmiAdvice = calculatorBrain.getBMIAdvice()
            destination.bmiColor = calculatorBrain.getBMIColor()
        }
    }
    
    
}


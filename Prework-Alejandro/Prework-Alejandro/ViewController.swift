//
//  ViewController.swift
//  Prework-Alejandro
//
//  Created by Alejandro Capellan on 8/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var currentSliderValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
    }

    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total  = bill + tip
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format:  "$%.2f", total)
        
    }
    
    @IBAction func customTipSlider(_ sender: Any) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        let customTipPercent = Int(Double(tipSlider.value * 100))
        let customTip = Double(tipSlider.value)
        let tip = bill * customTip
        let total  = bill + tip
        
        //Update Tip Amount Label
        currentSliderValue.text = String(customTipPercent)
        tipAmountLabel.text = String(format: "$%.0f", tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

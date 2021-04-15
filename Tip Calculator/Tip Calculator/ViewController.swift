//
//  ViewController.swift
//  Tip Calculator
//
//  Created by sowmya reddy atla on 4/14/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitAmountLabel: UILabel!
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        tipPercentageLabel.text! = "Tip " + String(Int(sender.value)) + "%"
    }
    @IBAction func splitSliderChanged(_ sender: Any) {
        splitLabel.text! = "Split: \(Int(splitSlider.value))"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculateTip()
        self.billAmountField.resignFirstResponder()
    }
    
    func calculateTip(){
        var tipAmount = Float()
        var splitAmount = Float()
        var total = Float()
        if let billAmount = Float(billAmountField.text!){
            tipAmount = billAmount * Float(tipSlider.value/100)
            total = tipAmount + billAmount
            splitAmount = total / Float(splitSlider.value)
        }
        else{
            tipAmount = 0
            splitAmount = 0
            total = 0
        }
        tipAmountLabel.text! = String(format: "$%.2f", tipAmount)
        totalLabel.text! = String(format: "$%.2f", total)
        splitAmountLabel.text! = String(format: "$%.2f", splitAmount)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }


}


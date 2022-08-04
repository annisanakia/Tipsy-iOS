//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var zeroPersenLabel: UIButton!
    @IBOutlet weak var tenPersenLabel: UIButton!
    @IBOutlet weak var twentyPersenLabel: UIButton!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var billTotalLabel: UITextField!
    
    var numberPeople = 2
    var percentTip = 0.1
    var totalBill = "0.0"
    
    @IBAction func tipChange(_ sender: UIButton) {
        zeroPersenLabel.isSelected = false
        tenPersenLabel.isSelected = false
        twentyPersenLabel.isSelected = false
        sender.isSelected = true
        
        let tip = sender.currentTitle!
        let droplast = String(tip.dropLast())
        percentTip = Double(droplast)! / 100.0
    }

    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperLabel.text = String(format: "%.0f", sender.value)
        numberPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Double(billTotalLabel.text!) ?? 0.0
        let tip = percentTip * bill
        let result = (bill + tip) / Double(numberPeople)
        totalBill = String(format: "%.2f", result)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalBill = totalBill
            destinationVC.numberPeople = numberPeople
            destinationVC.percentTip = String(percentTip * 100)

        }
    }
    
}


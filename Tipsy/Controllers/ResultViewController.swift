//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Pintro on 7/21/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var totalBill: String?
    var numberPeople: Int?
    var percentTip: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = totalBill
        detailLabel.text = "Split between \(numberPeople!) people, with \(percentTip!)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

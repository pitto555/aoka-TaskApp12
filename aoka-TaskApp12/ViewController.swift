//
//  ViewController.swift
//  aoka-TaskApp12
//
//  Created by aoka on 2021/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var taxExcludedValueTextField: UITextField!
    @IBOutlet private weak var taxTextField: UITextField!
    @IBOutlet private weak var taxIncludedLabel: UILabel!
    
    private var userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taxExcludedValueTextField.keyboardType = .numberPad
        taxTextField.keyboardType = .numberPad
        
        if  let taxText = userDefault.string(forKey: "taxText") {
            taxTextField.text = taxText
        }
    }

    @IBAction func calculationAction(_ sender: Any) {
        let taxExcludedValue = Float(taxExcludedValueTextField.text!) ?? 0
        let taxValue = Float(taxTextField.text!) ?? 0
        
        taxIncludedLabel.text = String(Int(taxExcludedValue * (taxValue / 100.0 + 1.0)))
    }
    
    @IBAction func edisingChanged(_ sender: Any) {
        userDefault.set(taxTextField.text, forKey: "taxText")
    }
}


//
//  ViewController.swift
//  credit-tracking
//
//  Created by Yuwa Yokohama on 24/08/18.
//  Copyright © 2018 Testing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var courseText: UITextField!
    
    @IBOutlet weak var stepperNonAction: UIStepper!
    
    @IBOutlet weak var maxskip: UILabel!
    
    @IBAction func addButton(_ sender: Any) {
        courses.append(["coursename":courseText.text!, "MaxSkip":"\(maxskip.text!)"])
        UserDefaults.standard.set(courses, forKey: "CurrentCourse")
        courseText.text = ""
        maxskip.text = "0"
        stepperNonAction.value = 0
        
    }
    @IBAction func stepper(_ sender: UIStepper) {
        maxskip.text? = String(Int(sender.value))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }


}


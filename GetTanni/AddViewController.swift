//
//  AddViewController.swift
//  GetTanni
//
//  Created by Kyuma Morita on 2018/06/08.
//  Copyright © 2018年 Kyuma Morita. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    var number: Int = 0
    @IBOutlet var label: UILabel!
    
    @IBOutlet var subjectTextField: UITextField!

    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard
    
    
    @IBAction func plus() {
        number = number + 1
        label.text = String(number)
    }
    
    @IBAction func minus() {
        number = number - 1
        label.text = String(number)
    }
    
    @IBAction func saveWord() {
        let wordDictionary = ["subject": subjectTextField.text!, "maxnum": label.text!]
        
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "科目の登録が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        self.present(alert, animated: true, completion: nil)
        subjectTextField.text = "subject"
        label.text = "maxnum"
    }
}

//
//  ListTableViewController.swift
//  GetTanni
//
//  Created by Kyuma Morita on 2018/06/08.
//  Copyright © 2018年 Kyuma Morita. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var wordArray:[Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil),
            forCellReuseIdentifier: "cell")
        // Initialization code
    }
    
    
}


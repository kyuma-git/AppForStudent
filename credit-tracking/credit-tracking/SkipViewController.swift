//
//  SkipViewController.swift
//  credit-tracking
//
//  Created by Yuwa Yokohama on 25/08/18.
//  Copyright © 2018 Testing. All rights reserved.
//

import UIKit

class SkipViewController: UIViewController {

    @IBOutlet weak var coursename: UILabel!
    @IBOutlet weak var remainingSkips: UILabel!
    
    @IBAction func skipped(_ sender: Any) {
        if activerow != -1 {
            var skips = Int(courses[activerow]["MaxSkip"]!)
            skips = skips! - 1
            courses[activerow]["MaxSkip"] = String(skips!)
            
            if skips == 2 {
                remainingSkips.textColor = UIColor.orange
            }else if skips! <= 1{
                remainingSkips.textColor = UIColor.red
            }
            remainingSkips.text = String(skips!)
        }
        UserDefaults.standard.set(courses, forKey: "CurrentCourse")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if activerow == -1 {
            coursename.text = "Sample Course"
            remainingSkips.text = "4"
        }
        
        if courses.count > activerow {
            if let name = courses[activerow]["coursename"] {
                if let remainings = courses[activerow]["MaxSkip"]{
                coursename.text = name
                    if Int(remainings) == 2 {
                        remainingSkips.textColor = UIColor.yellow
                    }else if Int(remainings)! <= 1{
                        remainingSkips.textColor = UIColor.red
                    }
                remainingSkips.text = remainings
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

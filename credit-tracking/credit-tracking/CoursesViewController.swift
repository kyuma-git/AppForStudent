//
//  CoursesViewController.swift
//  credit-tracking
//
//  Created by Yuwa Yokohama on 24/08/18.
//  Copyright © 2018 Testing. All rights reserved.
//

import UIKit

var courses = [Dictionary<String, String>()]
var activerow = -1

class CoursesViewController: UITableViewController {

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if courses.count == 1 && courses[0].count == 0 {
            courses.remove(at: 0)
            courses.append(["coursename":"Sample Course", "MaxSkip":"4"])
        }
        
        if let tempcourses = UserDefaults.standard.object(forKey: "CurrentCourse") {
            courses = tempcourses as! [Dictionary<String, String>]
        }
        table.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        if courses[indexPath.row]["coursename"] != nil {
            
            cell.textLabel?.text = courses[indexPath.row]["coursename"]
            
        }
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activerow = indexPath.row
        performSegue(withIdentifier: "toDetail", sender: nil)
    }


    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            courses.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(courses, forKey: "CurrentCourse")
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

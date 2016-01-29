//
//  ViewController.swift
//  College Profile Builder App
//
//  Created by PMuhs@bsd.220org on 1/20/16.
//  Copyright © 2016 PMuhs@bsd.220org. All rights reserved.
//

//
import UIKit
//be sure to add datasource tableview delegate protocols
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    var colleges: [College] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //setting datasource and delagate
        myTableView.dataSource = self
        myTableView.delegate = self
        
        colleges.append(College(College: "LSU", Location: "Baton Rouge", Picture: UIImage(named: "LSU")!, Students: 30451))
        colleges.append(College(College: "Tulane", Location: "New Orleans", Picture: UIImage(named: "Tulane")!, Students: 13449))
        colleges.append(College(College: "U of I", Location: "Illinois", Picture: UIImage(named: "Illinois")!, Students: 44087))
        
    }
    @IBAction func addbutoonTapped(sender: AnyObject) {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let CollegesTextField = myAlert.textFields![0] as UITextField
            let LocationTextField = myAlert.textFields![1]  as UITextField //basically connecting the text field
            let StudentsTextField = myAlert.textFields![2] as UITextField
            self.colleges.append(College(College: CollegesTextField.text!, Location: LocationTextField.text!, Students: Int(StudentsTextField.text!)!))
            
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        
        myAlert.addTextFieldWithConfigurationHandler { (collegeTextField) -> Void in
            collegeTextField.placeholder = "Add College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationTextField) -> Void in
            locationTextField.placeholder = "Add Location"
        }
        //this is what presents the alert
        self.presentViewController(myAlert, animated: true, completion: nil)
    }

    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        myTableView.editing = !myTableView.editing
        
        
    }
    
    
    //creates a cell that will store data
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = colleges[indexPath.row].college
        myTableViewCell.detailTextLabel!.text = colleges[indexPath.row].location
        return myTableViewCell
    }
    
    //sets number of rows in table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    //allows you to delete rows from table view
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
        
    }
    
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true   //allows you to move row
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let College = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)//you can move row
        colleges.insert(College, atIndex: destinationIndexPath.row)
        
        let Location = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(Location, atIndex: destinationIndexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailVC = segue.destinationViewController as!Detailed_College_View
        let selectrow = myTableView.indexPathForSelectedRow?.row
        detailVC.college = colleges[selectrow!]
    }
    
    
}
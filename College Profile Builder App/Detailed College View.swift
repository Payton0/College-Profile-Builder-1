//
//  Detailed College View.swift
//  College Profile Builder App
//
//  Created by PMuhs@bsd.220org on 1/26/16.
//  Copyright © 2016 PMuhs@bsd.220org. All rights reserved.
//

import UIKit

class Detailed_College_View: UIViewController {
    
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collegeName: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var numberOfStudents: UITextField!
   
    var college: College!
    
    override func viewDidLoad()
    {
       super.viewDidLoad()
        imageView.image = college.picture
        collegeName.text = college.college
        location.text = college.location
        numberOfStudents.text = String(college.students)
    }
    
    @IBAction func mySaveTapped(sender: AnyObject)
    {
    college.students = Int(numberOfStudents.text!)!
        college.college = collegeName.text!
        college.location = location.text!
        college.picture = imageView.image!
        
        }
    

}

    
    
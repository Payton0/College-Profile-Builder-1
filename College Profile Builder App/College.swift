//
//  College.swift
//  College Profile Builder App
//
//  Created by PMuhs@bsd.220org on 1/26/16.
//  Copyright © 2016 PMuhs@bsd.220org. All rights reserved.
//

import UIKit

class College: NSObject {
    var college = ""
    var location = ""
    var picture = UIImage(named: "Default")
    var students = 0
    
    init(College: String, Location: String, Picture: UIImage, Students: Int)
    {
        super.init()
        college = College
        location = Location
        picture = Picture
        students = Students
    }
    init(College: String, Location: String, Students: Int)
    {
        super.init()
        college = College
        location = Location
        students = Students
    
    }
}
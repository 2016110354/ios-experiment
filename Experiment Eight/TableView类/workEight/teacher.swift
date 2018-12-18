//
//  teacher.swift
//  workEight
//
//  Created by jiang on 2018/11/12.
//  Copyright © 2018年 jiang. All rights reserved.
//

import Foundation
class Teacher:Person
{
    var title:String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title=title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String
    {
        return "fullName: \(self.fullName), age: \(self.age), gender: \(self.gender) title:\(self.title)"
    }
}

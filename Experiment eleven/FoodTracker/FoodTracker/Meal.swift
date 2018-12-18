//
//  Meal.swift
//  FoodTracker
//
//  Created by zhaoru on 2018/12/10.
//  Copyright © 2018年 2016110354. All rights reserved.
//

import UIKit
import os.log

class Meal:NSObject,NSCoding {
    
    //Mark:Properties
    var name:String
    var photo:UIImage?
    var rating:Int
    
    //MARK:Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for:.documentDirectory,in:.userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK:Types
    struct PropertKey{
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    //MARK:Initialization
    init?(name:String,photo:UIImage?,rating:Int){
        guard !name.isEmpty else{
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else{
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    //MARK:NSCoding
    func encode(with aCoder:NSCoder){
        aCoder.encode(name,forKey:PropertKey.name)
        aCoder.encode(photo,forKey:PropertKey.photo)
        aCoder.encode(rating,forKey:PropertKey.rating)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        //The name is required.If we cannot decode a name string,the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey:PropertKey.name) as? String
        else{
            os_log("Unable to decode the name for a Meal object.",log:OSLog.default,type:.debug)
            return nil
        }
        let photo = aDecoder.decodeObject(forKey:PropertKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey:PropertKey.rating)
        
        //Must call designated initializer.
        self.init(name:name,photo:photo,rating:rating)
    }
}

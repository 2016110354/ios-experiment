//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by zhaoru on 2018/12/10.
//  Copyright © 2018年 2016110354. All rights reserved.
///Users/clown/Desktop/Wireshark

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    //MARK:Meal Class Tests
    func testMealInitializationSucceeds(){
        let zeroRatingMeal = Meal.init(name:"zero",photo:nil,rating:0)
        XCTAssertNotNil(zeroRatingMeal)
        
        let positiveRatingMeal = Meal.init(name:"Positive",photo:nil,rating:5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    func testMealInitializationFails(){
        let negativeRatingMeal = Meal.init(name:"Navigative",photo:nil,rating:-1)
        XCTAssertNil(negativeRatingMeal)
        
        let emptyStringMeal = Meal.init(name:"",photo:nil,rating:0)
        XCTAssertNil(emptyStringMeal)
        
        let largeRatingMael = Meal.init(name:"Large",photo:nil,rating:6)
        XCTAssertNil(largeRatingMael)
    }
    
}

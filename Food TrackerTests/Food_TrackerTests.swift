//
//  Food_TrackerTests.swift
//  Food TrackerTests
//
//  Created by William Hall on 2/4/17.
//  Copyright © 2017 William Hall. All rights reserved.
//

import XCTest
@testable import Food_Tracker

class Food_TrackerTests: XCTestCase {
    
    //MARK: Meal Class Tests
    
    //Confirm that the Meal object returns a meal object when passed valid parameters
    func testMealInitializationSucceedes(){
        
        //Zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //Highest positive rating
        let highestRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(highestRatingMeal)
    }
    
    //Confirm that Meal initialization fails when passed invalid parameters
    func testMealInitializationFails(){
        
        //Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        //Rating exceeds max
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        //Empty name
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    }
}

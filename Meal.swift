//
//  Meal.swift
//  Food Tracker
//
//  Created by William Hall on 2/27/17.
//  Copyright © 2017 William Hall. All rights reserved.
//

import UIKit

class Meal{
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int){
        //Initialization should fail if no name or rating is negative
        if(name.isEmpty || rating < 0){
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}

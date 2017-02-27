//
//  RatingControl.swift
//  Food Tracker
//
//  Created by William Hall on 2/21/17.
//  Copyright © 2017 William Hall. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    //MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder:coder)
        setupButtons()
    }
    
    
    //MARK: Actions
    func ratingButtonTapped(button: UIButton) {
        print("Button Pressed!!!")
    }
    
    //MARK: Private Mehtods
    private func setupButtons(){
        //loop for 5 buttons
        for _ in 0..<5 {
            //create button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            //add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            //setup button acton
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            //add buttons to the stack
            addArrangedSubview(button)
            
            //add new button to rating button array
            ratingButtons.append(button)
        }
    }
}

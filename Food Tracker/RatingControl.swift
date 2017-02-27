//
//  RatingControl.swift
//  Food Tracker
//
//  Created by William Hall on 2/21/17.
//  Copyright © 2017 William Hall. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder:coder)
        setupButtons()
    }
    
    //MARK: Private Mehtods
    private func setupButtons(){
        
    //create button
    let button = UIButton()
    button.backgroundColor = UIColor.red
        
    //add constraints
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
    
    
    //add buttons to the stack
    addArrangedSubview(button)
    }
}

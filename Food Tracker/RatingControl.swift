//
//  RatingControl.swift
//  Food Tracker
//
//  Created by William Hall on 2/21/17.
//  Copyright © 2017 William Hall. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    //MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet{
            updateButtonSelectionStates()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet{
            setupButtons()
        }
    }
    
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
        //print("Button Pressed!!!")
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        //calculate rating of selected button
        let selectedRating = index + 1
        
        
        if(selectedRating == rating){//if the selected star represents the current rating
            //reset rating to 0
            rating = 0
        } else {
            //if not set rating to selected star
            rating = selectedRating
        }
        
    }
    
    //MARK: Private Mehtods
    private func setupButtons(){
        
        //clear any existing buttons
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        //load star images
        let bundle = Bundle(for: type(of: self))
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        //loop for 5 buttons
        for _ in 0..<starCount {
            //create button
            let button = UIButton()
            
            //set button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            //add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //setup button acton
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            //add buttons to the stack
            addArrangedSubview(button)
            
            //add new button to rating button array
            ratingButtons.append(button)
        }
        
        //update buttons
        updateButtonSelectionStates()
    }
    
    //update selection of buttons
    private func updateButtonSelectionStates(){
        for(index, button) in ratingButtons.enumerated(){
                button.isSelected = index < rating
        }
        
    }
}

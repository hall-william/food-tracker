//
//  ViewController.swift
//  Food Tracker
//
//  Created by William Hall on 2/4/17.
//  Copyright © 2017 William Hall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameFieldText: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field's user input through delagate callbacks
        nameFieldText.delegate = self
    }
    
    //MARK: UITextFieldDeligate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }

}


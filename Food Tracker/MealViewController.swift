//
//  MealViewController.swift
//  Food Tracker
//
//  Created by William Hall on 2/4/17.
//  Copyright © 2017 William Hall. All rights reserved.
//
import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var meal: Meal?
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        //Unable the save button only if the user has entered a valid meal
        updateSaveButtonState()
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Disable the save button while editing
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Navigation
    //This method lets you configure a ViewController before it is presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        //configure the destination ViewController only if the save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, canceling.", log: OSLog.default, type: .debug)
        return
        }
        
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        
        //Set the meal to be passed to the MealTableViewController after the unwind segue.
        meal = Meal(name: name, photo: photo, rating: rating)
        
    }
    
    //MARK:  Actions
    @IBAction func selectPhotoFromLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)

    }

    //MARK: Private Methods
    private func updateSaveButtonState(){
        //Disable the save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}



//
//  MealTableViewController.swift
//  Food Tracker
//
//  Created by William Hall on 3/1/17.
//  Copyright © 2017 William Hall. All rights reserved.
//

import UIKit



class MealTableViewController: UITableViewController {

    
    //MARK: Properties
    var meals = [Meal]()
    private let reuseIdentifier = "Cell"
    
    //Mark: Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as?
            MealViewController, let meal = sourceViewController.meal {
            //add a new meal
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    //MARK: Private Methods
    private func loadSampleMeals(){
        
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let meal1 = Meal(name: "Sample Meal 1", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1.")
        }
        guard let meal2 = Meal(name: "Sample Meal 2", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2.")
        }
        guard let meal3 = Meal(name: "Sample Meal 3", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal3.")
        }
        
        meals += [meal1, meal2, meal3]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // load sample data
        loadSampleMeals()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in TableView: UITableView) -> Int {
        return 1
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        //fetches the appropriate meal
        let meal = meals[indexPath.row]
    
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

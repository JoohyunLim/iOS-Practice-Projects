//
//  MealController.swift
//  Meal
//
//  Created by mac13 on 2021/05/24.
//

import UIKit

class MealController: UITableViewController {
    var mealString: String?
    var cellText: String?
    var menuName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (title, description, imageName) in dataset {
                   let meal = Meal()
                   meal.title = title
                   meal.description = description
                   meal.image = UIImage(named: imageName)
                   meals.append(meal)
            
        }
     }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let meal = self.mealString {
            self.navigationItem.title = "Meal-\(meal)"
        }
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)

        cell.textLabel?.text = meals[indexPath.row].title

        return cell
    }
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //getting the current cell from the index path
            let currentCell = tableView.cellForRow(at: indexPath)
            //getting the text of that cell
            let currentText = currentCell?.textLabel?.text

        }
    
    
    */
    
    // MARK: - Navigation

 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
     let destination = segue.destination as? DetailController
    
    let index = tableView.indexPathForSelectedRow?.row
     if let destination = destination, let index = index {
        destination.image = meals[index].image
        destination.des = meals[index].description
        destination.index = index
     }
}
 
}

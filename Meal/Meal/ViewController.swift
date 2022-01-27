//
//  ViewController.swift
//  Meal
//
//  Created by mac13 on 2021/05/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var tableField: UITextField!
    @IBOutlet var mealLabel: UILabel!
    var mealName: String!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableField.backgroundColor = UIColor.green
        tableField.delegate = self
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let mealName = mealName{
            mealLabel.text = mealName
        }

    }
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

          if textField == self.tableField {
            if(textField.text != ""){
                if let mealName = mealName{
                    
                    let mealNameText = "table " + textField.text! + " ordered " + mealName
                    mealLabel.text = mealNameText
                    
                    textField.resignFirstResponder()
                }
            }
          }
        
        return true

      }

    
}


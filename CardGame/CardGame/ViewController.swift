//
//  ViewController.swift
//  CardGame
//
//  Created by mac13 on 2021/05/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var welcomeLabel: UILabel!
    var name1: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nameController = segue.destination as? ViewController2 else{
            return
        }
        nameController.name = name1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func useButton(_ sender: Any) {
        let nameStr = nameTextField.text
        let name = String(nameStr!)
        name1 = name
        
        if nameStr == ""{
            welcomeLabel.text = "Enter name please!"
        } else{
            welcomeLabel.text = "Welcome " + name + "!!"
        }
        
        nameTextField.resignFirstResponder()
    }
    
    
}


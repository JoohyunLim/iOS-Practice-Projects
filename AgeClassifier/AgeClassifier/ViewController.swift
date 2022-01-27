//
//  ViewController.swift
//  AgeClassifier
//
//  Created by mac17 on 2021/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var dingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dingButton(_ sender: Any) {
 
        let nameStr = nameTextField.text
        let ageStr = ageTextField.text
        let name = String(nameStr!)
        let age = Int(ageStr!)
        var ding = "기타"
        

        
        if nameStr == ""{
            dingLabel.text = "name을 입력하세요"
        } else if ageStr == ""{
            dingLabel.text = "age를 입력하세요"
        } else{
            if age!>=8 && age!<=13 {
                ding = "초딩"
            } else if age!>=14 && age!<=16{
                ding = "중딩"
            } else if age!>=17 && age!<=19{
                ding = "고딩"
            }
            
            dingLabel.text = name + "님은 " + ding
        }
        
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
   
    }
    
    @IBAction func comeback(segue: UIStoryboardSegue){
        
    }
}


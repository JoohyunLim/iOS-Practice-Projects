//
//  DetailController.swift
//  Meal
//
//  Created by mac13 on 2021/05/24.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet var mealImageView: UIImageView!
    var image: UIImage!
    @IBOutlet var desLabel: UILabel!
    var des: String!
    var menuName: String!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mealImageView.image = image
        desLabel.text = des

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        menuName = meals[index!].title
       // print(menuName!)
        
        let vc = tabBarController?.viewControllers![1] as! ViewController
        vc.mealName = menuName!
        
    }

}

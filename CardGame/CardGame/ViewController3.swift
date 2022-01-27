//
//  ViewController3.swift
//  CardGame
//
//  Created by mac13 on 2021/05/13.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    var youScore: Int = 0
    var meScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let c: (UIAlertAction) -> Void = { action in self.navigationController?.popViewController(animated: true) }
        let alertController = UIAlertController(title: "One more time?", message: "Your score:" + String(youScore) + " / My score:" + String(meScore), preferredStyle: UIAlertController.Style.actionSheet)
        let alertAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: c)
        alertController.addAction(alertAction)
        alertController.addAction(UIAlertAction(title: "No", style: .cancel))
        
        self.present(alertController, animated: true)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if youScore >= meScore{
            scoreLabel.text = "You Win!"
        } else{
            scoreLabel.text = "You Loose!"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
   /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

*/
}

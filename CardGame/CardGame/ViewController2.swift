//
//  ViewController2.swift
//  CardGame
//
//  Created by mac13 on 2021/05/06.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var youLabel: UILabel!
    @IBOutlet var meLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    var name: String?
    var youScore: Int = 0
    var meScore: Int = 0
    
    var cards: [Card] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let scoreController = segue.destination as? ViewController3 else{
            return
        }
        scoreController.youScore = youScore
        scoreController.meScore = meScore
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("eum")
        
        for i in 1...4 {
        for j in 1...13 {
           let s = Suit(rawValue: i)
           let r = Rank(rawValue: j)
           if let s = s, let r=r{
               let card = Card(suit: s, rank: r)
               cards.append(card)
           }
        }
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if name != "" && name != nil {
            nameLabel.text = name
        }
        
        youLabel.text = ""
        meLabel.text = ""
        youScore = 0
        meScore = 0
        
        cards.shuffle()
        for i in 0..<5 {
            youLabel.text!.append(cards[i].suit.description() + " " + cards[i].rank.description()+"\n")
            youScore = youScore + (cards[i].suit.rawValue * cards[i].rank.rawValue)
        }
        for i in 5..<10 {
            meLabel.text!.append(cards[i].suit.description() + " " + cards[i].rank.description()+"\n")
            meScore = meScore + (cards[i].suit.rawValue * cards[i].rank.rawValue)
        }

        //print(youScore)
        //print(meScore)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("doo")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("hun")
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

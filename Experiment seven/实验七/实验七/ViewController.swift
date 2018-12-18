//
//  ViewController.swift
//  实验七
//
//  Created by zhaoru on 2018/11/23.
//  Copyright © 2018年 2016110354. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(numberOfParisOfCards: (cardButtons.count+1)/2)
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips:\(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chosen card was no in the cardButtons")
        }
        
    }

    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if(card.isFaceUp){
                button.setTitle(emoji(for: card),for:UIControlState.normal)
                button.backgroundColor = UIColor.white
            }else{
                button.setTitle("",for:UIControlState.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
    }

    var emojiChoices = ["🐳","🌚","🌏","🌝","🍟","⚽️","🌽","🍩"]
    var emoji = [Int:String]()
    
    func emoji(for card:Card)->String{
        if emoji[card.identifier] == nil,emojiChoices.count > 0{
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


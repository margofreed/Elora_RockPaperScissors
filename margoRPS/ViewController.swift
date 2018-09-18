//
//  ViewController.swift
//  margoRPS
//
//  Created by Margo Freed on 7/9/18.
//  Copyright © 2018 Margo Freed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topSignLabel: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockButtonSign: UIButton!
    @IBOutlet weak var paperButtonSign: UIButton!
    @IBOutlet weak var scissorsButtonSign: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var eloraImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Button Selections
    @IBAction func rockSelected(_ sender: Any) {
        play(Sign.rock)
    }
    
    @IBAction func paperSelected(_ sender: Any) {
        play(Sign.paper)
    }
    
    @IBAction func scissorsSelected(_ sender: Any) {
        play(Sign.scissors)
    }
    
    //Play Again Button
    @IBAction func playAgainPressed(_ sender: UIButton) {
        resetBoard()
    }
    
    //Reset Game
    func resetBoard() {
        view.backgroundColor = UIColor.darkGray
        topSignLabel.text = "❓"
        eloraImage.image = #imageLiteral(resourceName: "elora_content")
        gameStatus.text = "Rock, Paper, Scissors?"
        rockButtonSign.isHidden = false
        rockButtonSign.isEnabled = true
        paperButtonSign.isHidden = false
        paperButtonSign.isEnabled = true
        scissorsButtonSign.isHidden = false
        scissorsButtonSign.isEnabled = true
        playAgainButton.isHidden = true
    }
    
    func play(_ playerTurn: Sign) {
        rockButtonSign.isEnabled = false
        paperButtonSign.isEnabled = false
        scissorsButtonSign.isEnabled = false
        
        let opponent = randomSign()
        topSignLabel.text = opponent.emoji
        
        let gameResult = playerTurn.takeTurn(opponent)
        switch gameResult {
        case .draw:
            gameStatus.text = "It's a draw!"
            view.backgroundColor = UIColor.lightGray
            eloraImage.image = #imageLiteral(resourceName: "elora_upset")
        case .lose:
            gameStatus.text = "Sorry, you lose."
            view.backgroundColor = UIColor.red
            eloraImage.image = #imageLiteral(resourceName: "elora_happy")
        case .win:
            gameStatus.text = "You win!"
            view.backgroundColor = UIColor.green
            eloraImage.image = #imageLiteral(resourceName: "elora_sad")
        case .start:
            gameStatus.text = "Rock, Paper, Scissors?"
            view.backgroundColor = UIColor.darkGray
            eloraImage.image = #imageLiteral(resourceName: "elora_content")
        }
        
        switch playerTurn {
        case .rock:
            rockButtonSign.isHidden = false
            paperButtonSign.isHidden = true
            scissorsButtonSign.isHidden = true
        case .paper:
            rockButtonSign.isHidden = true
            paperButtonSign.isHidden = false
            scissorsButtonSign.isHidden = true
        case .scissors:
            rockButtonSign.isHidden = true
            paperButtonSign.isHidden = true
            scissorsButtonSign.isHidden = false
        }
        
        playAgainButton.isHidden = false
    }
}



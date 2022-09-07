//
//  ViewController.swift
//  Right on target
//
//  Created by User on 7/27/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        
        updateLabelWithSecretValue(newText: String(game.currentSecretValue))
        
    }
    
    // MARK: - View - Model
    
    @IBAction func checkNumber() {
        game.calculateScore(with: Int(slider.value))
        
        if game.isGameEnded {
            game.restartGame()
        } else {
            game.startNewRound()
        }
        
        updateLabelWithSecretValue(newText: String(game.currentSecretValue))
    }

    // MARK: - updating View
    
    private func updateLabelWithSecretValue(newText: String) {
        label.text = newText
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Game Over",
                                      message: "You won \(score) points",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play again",
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


//
//  ViewController.swift
//  Krot
//
//  Created by Sergio Ramos on 23/07/2020.
//  Copyright © 2020 Sergio Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var lives: UILabel!

    @IBOutlet weak var timerLabel: UILabel!
    
    
    var seconds = 120
    var timer = Timer()
    var isTimerRunning = false

    var counterLives = 4
    var counterScore = 0
    var image = UIImage(named: "krot")
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let buttonWidth = 100
    let buttonHeight = 100
    var buttonX = 0
    var buttonY = 0
    
    var button = UIButton(type: .system)
    
    @objc func buttonClicked(sender : UIButton){
        button.isHidden = true
        counterScore += 1
        score.text = "Score: \(counterScore)"
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        runTimer()
        start.isHidden = true
    }

    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if seconds % 5 == 0 {
            if button.isHidden == false {
                counterLives -= 1
                lives.text = "Lives: \(counterLives)"
                button.isHidden = true
            }
            if seconds == 0 && counterLives > 0 {
                let dvc = storyboard?.instantiateViewController(withIdentifier: "Menu") as! MenuViewController
                dvc.text = """
                You win
                Score: \(counterScore)
                Try again
                """
                self.present(dvc, animated: false, completion: nil)
                zeroing()
            }
            if counterLives == 0 {
                let dvc = storyboard?.instantiateViewController(withIdentifier: "Menu") as! MenuViewController
                dvc.text = """
                You lose
                Score: \(counterScore)
                Try again
                """
                self.present(dvc, animated: false, completion: nil)
                zeroing()
            }
            if counterLives > 0 && seconds > 0 {
                buttonX = Int.random(in: 1..<Int(screenWidth) - 100)
                buttonY = Int.random(in: 100..<Int(screenHeight) - 100)
                createButton()
            }
        }
        seconds -= 1
        timerLabel.text = timeString(time: TimeInterval(seconds))
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func zeroing() {
        timer.invalidate()
        seconds = 120
        counterLives = 3
        counterScore = 0
        lives.text = "Lives: \(counterLives)"
        score.text = "Score: \(counterScore)"
        start.isHidden = false
        button.isHidden = true
    }
    
    func createButton() {
        button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
        button.isHidden = false
    }
}


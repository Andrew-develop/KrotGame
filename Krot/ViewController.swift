//
//  ViewController.swift
//  Krot
//
//  Created by Sergio Ramos on 23/07/2020.
//  Copyright © 2020 Sergio Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var lives: UILabel!

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    
    
    
    var seconds = 120
    var timer = Timer()
    var isTimerRunning = false

    var counterLives = 3
    var counterScore = 0
    
    @IBAction func startButton(_ sender: UIButton) {
        runTimer()
        sender.isHidden = true
    }

    
    
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if seconds == 0 && counterLives > 0 {
            let dest = storyboard?.instantiateViewController(withIdentifier: "Menu") as! Menu
            dest.text = """
                            You win
                            Score: \(counterScore)
                            Try again
            """
        }
        if seconds % 5 == 0 {
            if b1.isHidden == true && b2.isHidden == true && b3.isHidden == true && b4.isHidden == true && b5.isHidden == true && b6.isHidden == true && b7.isHidden == true && b8.isHidden == true {
            }
            else {
                b1.isHidden = true
                b2.isHidden = true
                b3.isHidden = true
                b4.isHidden = true
                b5.isHidden = true
                b6.isHidden = true
                b7.isHidden = true
                b8.isHidden = true
                counterLives -= 1
                lives.text = "Lives: \(counterLives)"
            }
            if counterLives == 0 {
                let dvc = storyboard?.instantiateViewController(withIdentifier: "Menu") as! Menu
                dvc.text = """
                You lose
                Score: \(counterScore)
                Try again
"""
                self.present(dvc, animated: false, completion: nil)
            }
            let between1And8 = UInt8.random(in: 1..<9)
            if between1And8 == 1 {
                b1.isHidden = false
            }
            else if between1And8 == 2 {
                b2.isHidden = false
            }
            else if between1And8 == 3 {
                b3.isHidden = false
            }
            else if between1And8 == 4 {
                b4.isHidden = false
            }
            else if between1And8 == 5 {
                b5.isHidden = false
            }
            else if between1And8 == 6 {
                b6.isHidden = false
            }
            else if between1And8 == 7 {
                b7.isHidden = false
            }
            else if between1And8 == 8 {
                b8.isHidden = false
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
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isHidden = true
        counterScore += 1
        score.text = "Score: \(counterScore)"
    }
    

}


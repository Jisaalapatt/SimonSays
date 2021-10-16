//
//  ViewController.swift
//  SimonSays
//
//  Created by Jisa Gigi on 10/16/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var simonLabel: UILabel!
    
    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer  = Timer()
    var simonTimer = Timer()
    var timeInt = 20
    var scoreInt = 0
    var modeInt = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        simonLabel.layer.cornerRadius = 10
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)

        
    }


    @IBAction func startGame(_ sender: Any) {
        
        if timeInt == 20 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            self.simonSays()
            modeInt = 1
            startGame.isEnabled = false
            startGame.alpha = 0.25
            startGame.setTitle("", for: .normal)
        }
        if timeInt == 0 {
            timeInt = 20
            scoreInt = 0
            scoreLabel.text = String("Score:\(scoreInt)")
            timeLabel.text = String("Time:\(timeInt)")
            startGame.setTitle("Start Game", for: .normal)
            simonLabel.text = "Simon Says"
            
        }
    }
    @objc func updateTimer(){
        timeInt -= 1
        timeLabel.text = String("Time:\(timeInt)")
        if timeInt == 0 {
            timer.invalidate()
            simonTimer.invalidate()
            simonLabel.text = "Game Over"
            modeInt = 0
            startGame.isEnabled = true
            startGame.alpha = 1
            startGame.setTitle("Restart", for: .normal)
        }
        
    }
    
    @objc func simonSays(){
        
        let array = ["Simon Says Swipe Right",
                     "Swipe Right",
                     "Simon Says Swipe Left",
                     "Simon Says Swipe Right",
                     "Simon Says Swipe Up",
                     "Simon Says Swipe Down",
                     "Swipe Right",
                     "Swipe Right",
                     "Simon Says Swipe Down",
                     "Swipe Left",
                     "Simon Says Swipe Left",
                     "Simon Says Swipe Right",
                     "Simon Says Swipe Up",
                     "Simon Says Swipe Down",
                     "Swipe Right"
                    ]
        let randomWord = Int(arc4random_uniform(UInt32(array.count)))
        simonLabel.text = array[randomWord]
        simonTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(simonSays), userInfo: nil, repeats: false)
        
    }
    @objc func swipeGestures(sender: UISwipeGestureRecognizer){
        if modeInt == 1{
            if sender.direction == UISwipeGestureRecognizer.Direction.right {
                simonTimer.invalidate()
                if simonLabel.text == "Simon Says Swipe Right"{
                    scoreInt += 1
                    scoreLabel.text = String("Score:\(scoreInt)")
                    self.simonSays()
                }else{
                    scoreInt -= 1
                    scoreLabel.text = String("Score:\(scoreInt)")
                    self.simonSays()

                }
            }
            
            if sender.direction == UISwipeGestureRecognizer.Direction.left {
                simonTimer.invalidate()
                if simonLabel.text == "Simon Says Swipe Left"{
                    scoreInt += 1
                    scoreLabel.text = String("Score:\(scoreInt)")
                    self.simonSays()
                }else{
                    scoreInt -= 1
                    scoreLabel.text = String("Score:\(scoreInt)")
                    self.simonSays()

                }
            }
            
            if sender.direction == UISwipeGestureRecognizer.Direction.up {
                simonTimer.invalidate()
                if simonLabel.text == "Simon Says Swipe Up"{
                    scoreInt += 1
                    scoreLabel.text = String("Score:\(scoreInt)")
                    self.simonSays()
                }else{
                    scoreInt -= 1
                    scoreLabel.text = String("Score:\(scoreInt)")
                    self.simonSays()

                }
            }
            if sender.direction == UISwipeGestureRecognizer.Direction.down {
                simonTimer.invalidate()
                if simonLabel.text == "Simon Says Swipe Down"{
                    scoreInt += 1
                    scoreLabel.text = String("Score:\(scoreInt)")
                    self.simonSays()
                }else{
                    scoreInt -= 1
                    scoreLabel.text = String("Score:\(scoreInt)")
                    self.simonSays()

                }
            }
            
            
            
        }
    }
}


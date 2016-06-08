//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by Paul McCartney on 2016/06/09.
//  Copyright © 2016年 shiba. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    
    @IBOutlet var resultLabel: UILabel!
    
    var timer: NSTimer!
    var score: Int = 1000
    let ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    let width: CGFloat = UIScreen.mainScreen().bounds.size.width
    
    var positionX: [CGFloat] = [0.0,0.0,0.0]
    var dx: [CGFloat] = [1.0,0.5,-1.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        positionX = [width/2,width/2,width/2]
        self.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func start() {
        resultLabel.hidden = true
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.005, target: self, selector: #selector(GameViewController.up),userInfo: nil,repeats: true)
        timer.fire()
    }
    
    func up() {
        for i in 0..<3 {
            if positionX[i] > width || positionX[i] < 0 {
                dx[i] = dx[i]*(-1)
            }
            positionX[i] += dx[i]
        }
        imageView1.center.x = positionX[0]
        imageView2.center.x = positionX[1]
        imageView3.center.x = positionX[2]
    }
    
    @IBAction func stop() {
        if timer.valid == true {
            timer.invalidate()
        }
        
        for i in 0..<3 {
            score = score - abs(Int(width/2 - positionX[i]))*2
        }
        resultLabel.text = "Score:"+String(score)
        resultLabel.hidden = false
        
        let highScore1: Int = ud.integerForKey("score1")
        let highScore2: Int = ud.integerForKey("score2")
        let highScore3: Int = ud.integerForKey("score3")
        
        if score > highScore1 {
            ud.setInteger(score, forKey: "score1")
            ud.setInteger(highScore1, forKey: "score2")
            ud.setInteger(highScore2, forKey: "score3")
        } else if score > highScore2 {
            ud.setInteger(score, forKey: "score2")
            ud.setInteger(highScore2, forKey: "score3")
        } else if score > highScore3 {
            ud.setInteger(score, forKey: "score3")
        }
        ud.synchronize()
    }
    
    @IBAction func retry() {
        score = 1000
        positionX = [width/2,width/2,width/2]
        self.start()
    }
    
    @IBAction func toTop() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

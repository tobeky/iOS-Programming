//
//  GameViewController.swift
//  IncrementalGame
//
//  Created by Toby Lewkowicz on 4/7/16.
//  Copyright (c) 2016 Toby Lewkowicz. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    @IBOutlet weak var numRobots: UILabel!
    @IBOutlet weak var amountMoney: UILabel!
    @IBOutlet weak var numSuperBots: UILabel!
    var robotCount: Int = 0
    var money: Int = 0
    var superBotCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
            
            NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector (addMoney), userInfo: nil, repeats: true)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func getMoney(sender: AnyObject) {
        money = money + 1
        amountMoney.text = "\(money) coins"
        
    }
    
    @IBAction func addRobot(sender: AnyObject) {
       let robotCost = 10 * (robotCount + 1)
        if money >= robotCost {
            money = money - robotCost
            robotCount = robotCount + 1
            numRobots.text = "\(robotCount) Robots"
        } else {
            
        }
    }
    
    @IBAction func addSuperBot(sender: AnyObject) {
        let superBotCost = 100 * (superBotCount + 1)
        if money >= superBotCost {
            money = money - superBotCost
            superBotCount = superBotCount + 1
            numSuperBots.text = "\(superBotCount) SuperBots"
        } else {
            
        }
    }
    
    
    func addMoney() {
        money = money + robotCount + 10 * superBotCount
        amountMoney.text = "\(money) coins"
    }
    
}

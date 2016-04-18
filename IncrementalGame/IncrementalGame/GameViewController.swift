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
    var robotCount: Int = 0
    var money: Int = 0
    
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
    
    @IBAction func addRobot(sender: AnyObject) {
        robotCount = robotCount + 1
        numRobots.text = "\(robotCount) robots"
    }
    func addMoney() {
        amountMoney.text = "\(money) coins"
    }
    
    
}

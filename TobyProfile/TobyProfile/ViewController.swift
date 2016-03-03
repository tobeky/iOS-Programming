//
//  ViewController.swift
//  TobyProfile
//
//  Created by Toby Lewkowicz on 2/29/16.
//  Copyright © 2016 Toby Lewkowicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileText: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var awesomeSecret: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func excitingButton(sender: AnyObject) {
        nameLabel.text = "Pokemon Trainer by night!"
        profileText.text = "Sylveon, go!"
        profileImage.image = UIImage(named: "Sylveon")
    }

    @IBAction func secretButton(sender: AnyObject) {
        awesomeSecret.text = "I'm pretty AWESOME!!!"
    }
}


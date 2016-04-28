//
//  ViewController.swift
//  Found
//
//  Created by Justin Vasselli on 4/25/16.
//  Copyright © 2016 Justin Vasselli. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.setUserTrackingMode(.Follow, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openAMap(sender: AnyObject) {
        if let url = NSURL(string: "http://maps.apple.com/?address=204,Barrows+Road,Brattleboro,Vermont") {
            let app = UIApplication.sharedApplication()
            app.openURL(url)
        }
    }

    @IBAction func addAPin(sender: AnyObject) {
        let alert = UIAlertController(title: "New Pin", message: "Name the Pin", preferredStyle: .Alert) //alert exists when you hit the button
        
        let save = UIAlertAction(title: "Save", style: .Default){ //save is an option, it does this:
            (action: UIAlertAction) -> Void in
            
            let textField = alert.textFields!.first
            
            let item = Pin(newLocation: self.mapView.userLocation.coordinate, withName: textField!.text!) //creates pin
            
            self.mapView.addAnnotation(item) //puts pin on map
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Default) {
            (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler() {
            (UITextField) -> Void in
        }
        
        alert.addAction(save)
        alert.addAction(cancel)
        
        presentViewController(alert, animated: true, completion: nil)
        
       
        
    }
    
    //For fun!!!
    //Use mapView.userLocation.coordinate.latitude / longitude to display latitud/longitude in the toolbar~
    //Display an alert to let the user name the pin
    //Add a way for user to share the location of a pin <-- Research!
}


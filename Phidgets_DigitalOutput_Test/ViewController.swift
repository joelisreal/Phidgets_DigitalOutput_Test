//
//  ViewController.swift
//  Phidget_DigitalOutput_Test
//
//  Created by Joel Igberase on 2019-04-11.
//  Copyright © 2019 Joel Igberase. All rights reserved.
//

import UIKit
import Phidget22Swift

class ViewController: UIViewController {
    
    //create object
    let led = DigitalOutput()
    
    func attach_handler(sender:Phidget) {
        do{
            print("Led Attached")
            
            //set output to 10%
            try led.setDutyCycle(0.9)
            
        } catch let err as PhidgetError {
            print("phidget error " + err.description)
        } catch {
            //catch other errors here
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do{
            //enable server discovery
            try Net.enableServerDiscovery(serverType: .deviceRemote)
            
            //address object
            try led.setDeviceSerialNumber(528025)
            try led.setHubPort(0)
            try led.setIsHubPortDevice(true)
            
            //add attach handler
            let _ = led.attach.addHandler(attach_handler)
            
            //open object
            try led.open()
            
            print(try Phidget.getLibraryVersion())
            
            
        } catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
            //catch other errors here
        }
    }
    
}


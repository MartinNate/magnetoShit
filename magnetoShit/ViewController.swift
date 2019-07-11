//
//  ViewController.swift
//  magnetoShit
//
//  Created by Martin Nate on 11/07/19.
//  Copyright © 2019 Martin Nate. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var magnetNumb: UILabel!
    @IBOutlet weak var magnetSq: UIView!
    let motionManager = CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        magnetoData()
        // Do any additional setup after loading the view.
    }
    func magnetoData(){
        if motionManager.isMagnetometerAvailable {
            motionManager.magnetometerUpdateInterval = 0.001
            motionManager.startMagnetometerUpdates(to: OperationQueue.main) { (data, error) in
                print(data!)
                self.magnetNumb.text = String(data!.magneticField.x)
                self.magnetSq.backgroundColor = UIColor(red: 255/255, green: 150/255, blue: 150/255, alpha: CGFloat(data!.magneticField.x))
            }
        }
    }

}


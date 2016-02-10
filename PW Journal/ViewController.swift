//
//  ViewController.swift
//  PW Journal
//
//  Created by nishant punia on 08/02/16.
//  Copyright © 2016 MLBNP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func emailLoginTapped(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("emailLoginController", sender: sender)
    }

}


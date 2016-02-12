//
//  ViewController.swift
//  PW Journal
//
//  Created by nishant punia on 08/02/16.
//  Copyright © 2016 MLBNP. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit



class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if NSUserDefaults.standardUserDefaults().valueForKey(keyForUID) != nil {
            self.performSegueWithIdentifier(identifierForSegues, sender: nil)
        }
    }
    @IBAction func emailLoginTapped(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("emailLoginController", sender: sender)
    }
    
    @IBAction func fbLoginTapped(sender: UITapGestureRecognizer) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"]) { (result: FBSDKLoginManagerLoginResult!, error: NSError!) -> Void in
            if error != nil {
                print("Facebook login failed. \(error.description)")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                
               DataService.ds.baseURL.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in
                if error != nil {
                    print(error.description)
                } else {
                    if error != nil {
                        print(error.description)
                    } else {
                        print("Successfully logged in \(authData)")
                        NSUserDefaults.standardUserDefaults().setObject(authData.uid, forKey: keyForUID)
                        self.performSegueWithIdentifier(identifierForSegues, sender: nil)
                    }
                }
               })
            }
        }
    }
    
    
    @IBAction func twitterLoginTapped(sender: UITapGestureRecognizer) {
        GIDSignIn.sharedInstance().signIn()
        }
    
   

}


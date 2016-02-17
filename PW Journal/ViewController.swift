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



class ViewController: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = "464672909246-qh5mgu25oakicep75eguat7g0oaemqk2.apps.googleusercontent.com"
       
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
                        let user = ["provider": authData.provider!]
                        DataService.ds.firebaseUsers(keyForUID, user: user)
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
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if error != nil {
            print(error.description)
        } else {
            DataService.ds.baseURL.authWithOAuthProvider("google", token: user.authentication.accessToken, withCompletionBlock: { error, authData in
                if error != nil {
                    print(error.description)
                } else {
                    print("Successfully logged in \(authData)")
                    let user = ["provider": authData.provider!]
                    DataService.ds.firebaseUsers(keyForUID, user: user)
                    NSUserDefaults.standardUserDefaults().setObject(authData.uid, forKey: keyForUID)
                    self.performSegueWithIdentifier(identifierForSegues, sender: nil)
                }
            })
        }
    }
   

}


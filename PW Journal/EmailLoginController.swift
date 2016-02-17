//
//  EmailLoginController.swift
//  PW Journal
//
//  Created by nishant punia on 10/02/16.
//  Copyright © 2016 MLBNP. All rights reserved.
//

import UIKit
import Firebase


class EmailLoginController: UIViewController {

    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var pwdTextField: EmailTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func submitBtnPressed(sender: UIButton!) {
        if let email = emailTextField.text where email != "" , let pwd = pwdTextField.text where pwd != "" {
            DataService.ds.baseURL.authUser(email, password: pwd, withCompletionBlock: { error, authData in
                if error != nil {
                    if error.code == -8 {
                        DataService.ds.baseURL.createUser(email, password: pwd, withValueCompletionBlock: { error, result in
                            if error != nil {
                                self.errorMsg("Something went wrong", message: "Check your details and Try Again!")
                            } else {
                                NSUserDefaults.standardUserDefaults().setObject(result[keyForUID], forKey: keyForUID)
                                DataService.ds.baseURL.authUser(email, password: pwd, withCompletionBlock: { error, result in
                                    if error != nil {
                                        self.errorMsg("Bad Email or Password", message: "Please check your email and password again")
                                    } else {
                                        let user = ["provider": result.provider!]
                                        DataService.ds.firebaseUsers(keyForUID, user: user)
                                        self.performSegueWithIdentifier("emailLogin", sender: nil)
                                    }
                                })
                            }
                        })
                    }
                } else {
                    print("Nice Work")
                }
            })
        } else {
            errorMsg("Email or Password Missing", message: "Please enter your email and password")
        }
    }
    
    func errorMsg(title: String, message: String) {
        let error = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        error.addAction(action)
        
        self.presentViewController(error, animated: true, completion: nil)
    }

}

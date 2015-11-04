//
//  LoginSignupPickerViewController.swift
//  Timeline
//
//  Created by JB on 11/3/15.
//  Copyright © 2015 Josh Burt. All rights reserved.
//

import UIKit

class LoginSignupPickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "signupSegue" {
            if let signUpViewController = segue.destinationViewController as? LoginSignupViewController {
                signUpViewController.loadView()
                signUpViewController.updateViewForMode(ViewMode.Signup)
            }
        } else if segue.identifier == "loginSegue" {
            if let signUpViewController = segue.destinationViewController as? LoginSignupViewController {
                signUpViewController.loadView()
                signUpViewController.updateViewForMode(ViewMode.Login)
            }

        }


    }

}

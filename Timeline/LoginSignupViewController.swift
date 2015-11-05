//
//  LoginSignupViewController.swift
//  Timeline
//
//  Created by JB on 11/3/15.
//  Copyright © 2015 Josh Burt. All rights reserved.
//

import UIKit


class LoginSignupViewController: UIViewController {
    
    enum ViewMode {
        case Login, Signup
    }

    // MARK: - Properties
    
    var mode: ViewMode = .Signup
    
    var fieldsAreValid: Bool {
        if mode == .Login{
            return usernameField.hasText() && passwordField.hasText()
        } else {
            return usernameField.hasText() && passwordField.hasText() && emailField.hasText()
        }
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var bioField: UITextField!
    
    @IBOutlet weak var uRLField: UITextField!
    
    @IBOutlet weak var actionButton: UIButton!
    
    
    @IBAction func actionButtonTapped(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        if fieldsAreValid && mode == .Signup{

            UserController.createUser(emailField.text!, username: usernameField.text!, password: passwordField.text!, bio: bioField.text, url: uRLField.text, completion: { (success, user) -> Void in
                
                if success {
                    // dismiss the viewController using the user variable
                    
                } else {
                    // popup saying it failed.
                    self.presentValidationAlertWithTitle("Sign-Up Failed", message: "Oops! Something went wrong! Enter correct information this time Dummy.")
                }
            })
            
        } else if fieldsAreValid && mode == .Login {
            
            UserController.authenticateUser(emailField.text!, password: passwordField.text!, completion: { (success, user) -> Void in
                if success {
                    // dismiss the controller using the user variable
                    
                } else {
                    self.presentValidationAlertWithTitle("Login Failed", message: "Something was wrong. Chekc your password and username to make sure it is correct. You have 1 attempt left before the cops are called.")
                }
            })
            
        }
        
    }
    
    func presentValidationAlertWithTitle(title: String, message: String) {
        
        // STEP 1: Create the alert controller and set the preferredStyle to .ActionSheet or .Alert
        let validationAlert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        // STEP 2: Create the alertAction(s) (AKA "buttons")
        let okAlert =  UIAlertAction(title: "ok", style: .Default, handler: nil)
        // STEP 3: Add the alertAction(s) to the alertController
        validationAlert.addAction(okAlert)
        // STEP 4: Present the Alert Controller
        presentViewController(validationAlert, animated: true, completion: nil)// completion is code that will happen each time the alert is dismissed, no matter what alertAction is pressed.
    }
    
    
    
    func updateViewForMode(mode: ViewMode) {
        self.mode = mode
        if mode == .Login {
            emailField.hidden = true
            bioField.hidden = true
            uRLField.hidden = true
            actionButton.setTitle("Login", forState: .Normal)
        } else {
            actionButton.setTitle("Sign Upppp", forState: .Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViewForMode(.Signup)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

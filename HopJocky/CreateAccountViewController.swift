//
//  CreateAccountViewController.swift
//  HopJocky
//
//  Created by Matt Union on 3/9/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //private var _USER_REF = Firebase(url: "\(BASE_URL)/users")


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func createAccountAction(sender: AnyObject) {
        let email = self.emailTextField.text
        let password = self.passwordTextField.text
        let confirmPassword = self.confirmPasswordTextField.text

        if password != confirmPassword{
            let alert = UIAlertController(title: "Error", message: "Passwords didn't match", preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alert.addAction(action)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
            
        else if email != "" && password != ""{
            FIREBASE_REF.createUser(email, password: password, withValueCompletionBlock: { (error, authData) -> Void in
                
                if error == nil{
                    FIREBASE_REF.authUser(email, password: password, withCompletionBlock: { (error, authData) -> Void in
                        if error == nil{
                            NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                            
                            //add user model to users database
                            let user = ["email": email!, "password": password!, "beercred": 0]
                            USERS_REF.childByAppendingPath(authData.uid).setValue(user)
                            
                            print("Account Created :)")
                            
                            self.dismissViewControllerAnimated(true, completion: nil)
                        }
                        else{
                           print(error)
                        }
                    })
                }
                else{
                    print(error)
                    
                    let alert = UIAlertController(title: "Error", message: String(error), preferredStyle: .Alert)
                    
                    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    
                    alert.addAction(action)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            })
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Enter Email and Password.", preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alert.addAction(action)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    @IBAction func cancelAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

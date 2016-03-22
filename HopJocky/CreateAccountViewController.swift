//
//  CreateAccountViewController.swift
//  HopJocky
//
//  Created by Matt Union on 3/9/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    //private var _USER_REF = Firebase(url: "\(BASE_URL)/users")


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    @IBAction func createAccountAction(sender: AnyObject) {
        let email = self.emailTextField.text
        let password = self.passwordTextField.text
        
        if email != "" && password != ""{
            FIREBASE_REF.createUser(email, password: password, withValueCompletionBlock: { (error, authData) -> Void in
                
                if error == nil{
                    FIREBASE_REF.authUser(email, password: password, withCompletionBlock: { (error, authData) -> Void in
                        if error == nil{
                            NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                            
                            //add user model to users database
                            let user = ["email": email!, "password": password!, "beercred": 0]
                            _USERS_REF.childByAppendingPath(authData.uid).setValue(user)
                            
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

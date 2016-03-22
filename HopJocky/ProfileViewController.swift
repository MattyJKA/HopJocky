//
//  ProfileViewController.swift
//  HopJocky
//
//  Created by Matt Union on 3/21/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var beercredLabel: UILabel!
    let _USER_REF = Firebase(url: "\(BASE_URL)/users/\(NSUserDefaults.standardUserDefaults().valueForKey("uid")!)")
    var credCount: Int = 0;


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Read data and react to changes

        
        _USER_REF.observeEventType(.Value, withBlock: {
            snapshot in
            let snap = snapshot.value
            
            if let userDictionary = snap as? Dictionary<String, AnyObject> {
                self.emailLabel.text = userDictionary["email"] as? String
                self.passwordLabel.text = userDictionary["password"] as? String
                self.beercredLabel.text = String(userDictionary["beercred"]!)
                self.credCount = (userDictionary["beercred"] as? Int)!
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBeercred(sender: AnyObject) {
        let newVal = credCount + 1
        _USER_REF.childByAppendingPath("beercred").setValue(newVal)

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

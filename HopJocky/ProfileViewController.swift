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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Read data and react to changes
        
        self.emailLabel.text = user?.email
        self.passwordLabel.text = user?.password
        self.beercredLabel.text = String(user!.beercred)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBeercred(sender: AnyObject) {
        user?.addCred(1)
        user?.push()
    }

}

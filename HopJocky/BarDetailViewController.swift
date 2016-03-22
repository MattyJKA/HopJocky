//
//  BarDetailViewController.swift
//  HopJocky
//
//  Created by Matt Union on 3/22/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit

class BarDetailViewController: UIViewController {
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var HappyHourLabel: UILabel!
    @IBOutlet weak var HoursLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    var barObj: Bar? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NameLabel.text = barObj?.name
        HappyHourLabel.text = barObj?.happyHour
        HoursLabel.text = barObj?.hours
        LocationLabel.text = barObj?.location
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

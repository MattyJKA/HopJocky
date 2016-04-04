//
//  BeerDetailViewController.swift
//  HopJocky
//
//  Created by Matt Union on 3/22/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ABVLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var StyleLabel: UILabel!
    var beerObj: Beer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NameLabel.text = beerObj?.name
        StyleLabel.text = beerObj?.style
        
        if self.beerObj?.abv == -1{
            ABVLabel.text = "Unknown"
        }
        else{
            ABVLabel.text = String(beerObj!.abv) + "%"
        }
        
        if self.beerObj?.price == -1{
            PriceLabel.text = "Unknown"
        }
        else{
            PriceLabel.text = "$" + String(beerObj!.price)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func HadBeerButton(sender: AnyObject) {
        user.addBeer((beerObj?.name)!)
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

//
//  MenuTableViewController.swift
//  HopJocky
//
//  Created by Matt Union on 3/22/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import Firebase

class MenuTableViewController: UITableViewController {
    var barName: String? = nil
    var beers = [Beer]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let BEERS_REF = Firebase(url: "\(BASE_URL)/Bars/\(barName!)/Beers")
        BEERS_REF.observeEventType(.Value, withBlock: { snapshot in
            
            //the snapshot is a current look at our bars data
            //print(snapshot.value)
            
            self.beers = []
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                for snap in snapshots{
                    //make our bars array for tableview
                    if let barDict = snap.value as? Dictionary<String, AnyObject>{
                        let name = snap.key
                        let beer = Beer(key: name, dict: barDict)
                        
                        //insert new bar object into bar array
                        self.beers.insert(beer, atIndex: 0)
                    }
                }
            }
            //be sure that the tableView updates when there is new data
            self.tableView.reloadData()
            
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("beerCell", forIndexPath: indexPath)

        // Configure the cell...
        let beer = beers[indexPath.row]
        cell.textLabel?.text = beer.name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        
        let indexPath = self.tableView.indexPathForSelectedRow
        
        let beerDetailView = segue.destinationViewController as! BeerDetailViewController
        
        beerDetailView.beerObj = beers[indexPath!.row]
    }
    

}

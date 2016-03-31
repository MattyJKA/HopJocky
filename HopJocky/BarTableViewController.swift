//
//  BarTableViewController.swift
//  HopJocky
//
//  Created by Matt Union on 3/22/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import Firebase

class BarTableViewController: UITableViewController {
    var bars = [Bar]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BARS_REF.observeEventType(.Value, withBlock: { snapshot in
            
            //the snapshot is a current look at our bars data
            //print(snapshot.value)
            
            self.bars = []
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                for snap in snapshots{
                    //make our bars array for tableview
                    if let barDict = snap.value as? Dictionary<String, AnyObject>{
                        let name = snap.key
                        let bar = Bar(key: name, dict: barDict)
                        
                        //insert new bar object into bar array
                        self.bars.insert(bar, atIndex: 0)
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
        return bars.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellid", forIndexPath: indexPath)

        // Configure the cell...
        let bar = bars[indexPath.row]
        cell.textLabel?.text = bar.name

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let indexPath = self.tableView.indexPathForSelectedRow
        
        let barDetailView = segue.destinationViewController as! BarDetailViewController
        
        barDetailView.barObj = bars[indexPath!.row]
    }


}

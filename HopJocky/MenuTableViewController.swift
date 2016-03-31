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
    var detail = "Price"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func NameOrderButton(sender: AnyObject) {
        self.beers.removeAll()
        self.detail = "Price"
        let BEERS_REF = Firebase(url: "\(BASE_URL)/Bars/\(barName!)/Beers")
        BEERS_REF.queryOrderedByChild("Name").observeEventType(.ChildAdded, withBlock: { snapshot in
            //create beerObj out of database dict
            if let beerDict = snapshot.value as? Dictionary<String,AnyObject>{
                let beer = Beer(key: snapshot.key, dict: beerDict)
                self.beers.append(beer)
            }
            self.tableView.reloadData()
        })
    }
    
    @IBAction func PriceOrderButton(sender: AnyObject) {
        self.beers.removeAll()
        self.detail = "Price"
        let BEERS_REF = Firebase(url: "\(BASE_URL)/Bars/\(barName!)/Beers")
        BEERS_REF.queryOrderedByChild("Price").observeEventType(.ChildAdded, withBlock: { snapshot in
            //create beerObj out of database dict
            if let beerDict = snapshot.value as? Dictionary<String,AnyObject>{
                let beer = Beer(key: snapshot.key, dict: beerDict)
                self.beers.append(beer)
            }
            self.tableView.reloadData()
        })
    }

    @IBAction func ABVOrderButton(sender: AnyObject) {
        self.beers.removeAll()
        self.detail = "ABV"
        let BEERS_REF = Firebase(url: "\(BASE_URL)/Bars/\(barName!)/Beers")
        BEERS_REF.queryOrderedByChild("ABV").observeEventType(.ChildAdded, withBlock: { snapshot in
            //create beerObj out of database dict
            if let beerDict = snapshot.value as? Dictionary<String,AnyObject>{
                let beer = Beer(key: snapshot.key, dict: beerDict)
                self.beers.append(beer)
            }
            self.tableView.reloadData()
        })
    }
    
    @IBAction func StyleOrderButton(sender: AnyObject) {
        self.beers.removeAll()
        self.detail = "Style"
        let BEERS_REF = Firebase(url: "\(BASE_URL)/Bars/\(barName!)/Beers")
        BEERS_REF.queryOrderedByChild("Style").observeEventType(.ChildAdded, withBlock: { snapshot in
            //create beerObj out of database dict
            if let beerDict = snapshot.value as? Dictionary<String,AnyObject>{
                let beer = Beer(key: snapshot.key, dict: beerDict)
                self.beers.append(beer)
            }
            self.tableView.reloadData()
        })
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

        if(self.detail == "ABV"){
            if beer.abv == -1 {
                cell.detailTextLabel?.text = "Unknown"
            }
            else{
                cell.detailTextLabel?.text = String(beer.abv) + "%"
            }
        }
        else if(self.detail == "Style"){
            cell.detailTextLabel?.text = beer.style
        }
        else if(self.detail == "Price"){
            if beer.price == -1{
                cell.detailTextLabel?.text = "Unknown"
            }
            else{
                cell.detailTextLabel?.text = "$" + String(beer.price)                
            }
        }

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        
        let indexPath = self.tableView.indexPathForSelectedRow
        
        let beerDetailView = segue.destinationViewController as! BeerDetailViewController
        
        beerDetailView.beerObj = beers[indexPath!.row]
    }
    

}

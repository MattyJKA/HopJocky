//
//  BeerchievementsCollectionViewController.swift
//  HopJocky
//
//  Created by Matt Union on 4/4/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BeerchievementsCollectionViewController: UICollectionViewController {
    var alertController:UIAlertController? = nil
    let beerchievementKeys = Array(user.earnedBeerchievements.keys)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.earnedBeerchievements.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BeerchievementCollectionViewCell
    
        // Configure the cell
        let beerchievementID = self.beerchievementKeys[indexPath.row]
        let beerchievement = allBeerchievements[beerchievementID]
        cell.BeerchievementImage.image = beerchievement!.image
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let beerchievementID = self.beerchievementKeys[indexPath.row]
        let beerchievement = allBeerchievements[beerchievementID]
        
        self.alertController = UIAlertController(title: "\(beerchievement!.name)", message: "\(beerchievement!.howToUnlock)", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Make Profile Pic", style: UIAlertActionStyle.Default) { (action:UIAlertAction) in
            user.changeProfilePic("\(beerchievement!.name)")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action:UIAlertAction) in
        }
        
        self.alertController!.addAction(okAction)
        self.alertController!.addAction(cancelAction)
        
        self.presentViewController(self.alertController!, animated: true, completion:nil)
    }
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}

//
//  Beerchievements.swift
//  HopJocky
//
//  Created by Matt Union on 4/4/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import Foundation
import UIKit

class Beerchievements: NSObject{
    private var Dict = [String: Beerchievement]()
    
    var dict: [String: Beerchievement]{
        return self.Dict
    }
    
    override init() {
        super.init()
        // Populate the array
        self.populateList()
    }
    
    func populateList(){
        Dict["Bar Hopper"] = (Beerchievement(name:"Bar Hopper", howToUnlock: "check into 2 or more bars in one night", reward: 150, image: UIImage(named: "hopper")!))
        Dict["I Remember My First Beer"] = (Beerchievement(name:"I Remember My First Beer", howToUnlock: "Have your first beer on Hopjocky", reward: 100, image: UIImage(named:"firstBeer")!))
        Dict["Newb"] = (Beerchievement(name:"Newb", howToUnlock: "Create a HopJocky Account", reward: 100, image: UIImage(named:"newb")!))
        Dict["Gettin' Dirty"] = (Beerchievement(name:"Gettin' Dirty", howToUnlock: "Check-in at a bar on dirty 6th", reward: 600, image: UIImage(named:"dirty")!))
        Dict["Rainey"] = (Beerchievement(name:"Rainey", howToUnlock: "Check-in at a bar on Rainey St.", reward: 500, image: UIImage(named:"rain")!))
        Dict["What a Drag"] = (Beerchievement(name:"What a Drag", howToUnlock: "Check-in at a bar on the drag", reward: 500, image: UIImage(named:"drag")!))
        Dict["5 O'clock Somewhere"] = (Beerchievement(name:"5 O'clock Somewhere", howToUnlock: "Check into a bar before 5PM", reward: 500, image: UIImage(named:"5 O'clock")!))
        
    }
}
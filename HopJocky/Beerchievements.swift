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
    private var List = [Beerchievement]()
    
    var list: Array<Beerchievement>{
        return self.List
    }
    
    override init() {
        super.init()
        // Populate the array
        self.populateList()
    }
    
    func populateList(){
        List.append(Beerchievement(name:"Bar Hopper", howToUnlock: "check into 2 or more bars in one night", reward: 150, image: UIImage(named: "hopper")!))
        List.append(Beerchievement(name:"I Remember My First Beer", howToUnlock: "Have your first beer on Hopjocky", reward: 100, image: UIImage(named:"firstBeer")!))
        
    }
}
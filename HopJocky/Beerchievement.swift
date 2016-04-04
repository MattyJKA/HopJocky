//
//  Beerchievement.swift
//  HopJocky
//
//  Created by Matt Union on 3/31/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import Foundation
import UIKit

class Beerchievement: NSObject{
    private var Name: String!
    private var HowToUnlock: String!
    private var Reward: Int!
    private var Image: UIImage? = nil
    
    var name: String{
        return self.Name
    }
    
    var howToUnlock: String{
        return self.HowToUnlock
    }
    
    var reward: Int{
        return self.Reward
    }
    
    var image: UIImage?{
        return self.Image
    }
    
    init(name: String, howToUnlock: String, reward: Int, image: UIImage?){
        self.Name = name
        self.HowToUnlock = howToUnlock
        self.Reward = reward
        self.Image = image
    }
}
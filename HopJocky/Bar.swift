//
//  Bar.swift
//  HopJocky
//
//  Created by Matt Union on 3/22/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import Foundation

class Bar{
    private var Name: String!
    private var Beers: Array<Beer>!
    private var HappyHour: String!
    private var Hours: String!
    private var Location: String!
    
    var name: String {
        return Name
    }
    
    var beerList: Array<Beer> {
        return Beers
    }
    
    var happyHour: String{
        return HappyHour
    }
    
    var hours: String {
        return Hours
    }
    
    var location: String {
        return Location
    }
    
    //initilize bar
    init(key: String, dict: Dictionary<String, AnyObject>){
        self.Name = key
        
        if let barBeers = dict["Beers"] as? Array<Beer> {
            self.Beers = barBeers
        }
        
        if let barHappyHour = dict["Happy Hour"] as? String {
            self.HappyHour = barHappyHour
        }
        
        if let barHours = dict["Hours"] as? String {
            self.Hours = barHours
        }
        
        if let barLocation = dict["Location"] as? String {
            self.Location = barLocation
        }
    }
    
}
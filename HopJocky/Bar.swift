//
//  Bar.swift
//  HopJocky
//
//  Created by Matt Union on 3/22/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import Foundation

class Bar{
    private var _name: String!
    private var _beers: Array<Beer>!
    private var _happyHour: String!
    private var _hours: String!
    private var _location: String!
    
    var name: String {
        return _name
    }
    
    var beerList: Array<Beer> {
        return _beers
    }
    
    var happyHour: String{
        return _happyHour
    }
    
    var hours: String {
        return _hours
    }
    
    var location: String {
        return _location
    }
    
    //initilize bar
    init(key: String, dict: Dictionary<String, AnyObject>){
        self._name = key
        
        if let barBeers = dict["Beers"] as? Array<Beer> {
            self._beers = barBeers
        }
        
        if let barHappyHour = dict["Happy Hour"] as? String {
            self._happyHour = barHappyHour
        }
        
        if let barHours = dict["Hours"] as? String {
            self._hours = barHours
        }
        
        if let barLocation = dict["Location"] as? String {
            self._location = barLocation
        }
    }
    
}
//
//  Beer.swift
//  HopJocky
//
//  Created by Matt Union on 3/22/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import Foundation

class Beer{
    private var Key: String!
    private var Name: String!
    private var ABV: Int!
    private var Price: Int!
    private var Style: String!
    
    var name: String {
        return Name
    }
    
    var abv: Int {
        return ABV
    }
    
    var price: Int{
        return Price
    }
    
    var style: String {
        return Style
    }

    //initilize beer
    init(key: String, dict: Dictionary<String, AnyObject>){
        self.Key = key
        
        if let beerName = dict["Name"] as? String {
            self.Name = beerName
        }
        
        if let beerABV = dict["ABV"] as? Int {
            self.ABV = beerABV
        }
        else{
            self.ABV = -1
        }
        
        if let beerPrice = dict["Price"] as? Int {
            self.Price = beerPrice
        }
        else{
            self.Price = -1
        }
        
        if let beerStyle = dict["Style"] as? String {
            self.Style = beerStyle
        }
    }

}
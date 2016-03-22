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
    private var ABV: String!
    private var Price: String!
    private var Style: String!
    
    var name: String {
        return Name
    }
    
    var abv: String {
        return ABV
    }
    
    var price: String{
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
        
        if let beerABV = dict["ABV"] as? String {
            self.ABV = beerABV
        }
        
        if let beerPrice = dict["Price"] as? String {
            self.Price = beerPrice
        }
        
        if let beerStyle = dict["Style"] as? String {
            self.Style = beerStyle
        }
    }

}
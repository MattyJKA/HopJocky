//
//  User.swift
//  HopJocky
//
//  Created by Matt Union on 3/31/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import Foundation
import Firebase

class User{
    private var Uid: String?
    private var Email: String?
    private var Password: String?
    private var Beercred: Int?
    private var Title: String?
    private var BarsVisted: Array<Array<Any>>? //needs to keep track of bars visted as well as how many times visted
    private var BeersHad = Array<String>()
    private var Beerchievements = Array<Int>()
    private var ProfilePic: String?
    
    private var USER_REF: Firebase?

    var uid: String{
        return self.Uid!
    }
    
    var email: String{
        return self.Email!
    }
    
    var password: String{
        return self.Password!
    }
    
    var beercred: Int{
        return self.Beercred!
    }
    
    var beerchievements: Array<Int>{
        return self.Beerchievements
    }
    
    init(uid: String){
        self.Uid = uid
        self.Email = nil
        self.Password = nil
        self.Beercred = nil
        self.Title = nil
        self.BarsVisted = nil
        self.ProfilePic = nil
        
        self.USER_REF = Firebase(url: "\(BASE_URL)/users/\(self.Uid!)")
    }
    
    func addCred(earnedCred: Int){
        self.Beercred! += earnedCred
    }
    
    func addBeer(beerName: String){
        if BeersHad.isEmpty{
            Beerchievements.append(1)
            //add alert controller to tell user they got a beerchievement, maybe it's own func
        }
        BeersHad.append(beerName)
        checkForBeerchievement()
    }
    
    //check user into a bar
    func checkin(barName:String) -> String{
        return barName
    }
    
    //check if user has met requirements for any Beerchievemnt
    func checkForBeerchievement(){
        //add alert controller to tell user they got a beerchievement, maybe it's own func
    }
    
    //update database with new user info
    func push(){
        self.USER_REF!.childByAppendingPath("beercred").setValue(self.beercred)
    }
    
    //check database for new user info
    func pull(){
        self.USER_REF!.observeEventType(.Value, withBlock: {
            snapshot in
            let snap = snapshot.value
            
            if let userDictionary = snap as? Dictionary<String, AnyObject> {
                self.Email = userDictionary["email"] as? String
                self.Password = userDictionary["password"] as? String
                self.Beercred = (userDictionary["beercred"] as? Int)!
                //add update for beerlist beerchievements
            }
        })
 
    }
}
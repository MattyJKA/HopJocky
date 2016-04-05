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
    private var BeersHad: Dictionary<String, Int> = [:]
    private var EarnedBeerchievements: Dictionary<String,Int> = [:]
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
    
    var earnedBeerchievements: Dictionary<String, Int>{
        return self.EarnedBeerchievements
    }
    
    var beersHad: Dictionary<String, Int>{
        return self.BeersHad
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
        if(BeersHad[beerName] == nil){
        
            if BeersHad.isEmpty{
                EarnedBeerchievements["I Remember My First Beer"] = earnedBeerchievements.count + 1
                //add reward
                //add alert controller to tell user they got a beerchievement, maybe it's own func
            }
        
            BeersHad[beerName] = BeersHad.count + 1
            checkForBeerchievement()
            push()
        }
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
        self.USER_REF!.childByAppendingPath("Beercred").setValue(self.beercred)
        self.USER_REF!.childByAppendingPath("Beerchievements").setValue(self.earnedBeerchievements)
        self.USER_REF!.childByAppendingPath("BeersHad").setValue(self.beersHad)
    }
    
    //check database for new user info
    func pull(){
        self.USER_REF!.observeEventType(.Value, withBlock: {
            snapshot in
            let snap = snapshot.value
            
            if let userDictionary = snap as? Dictionary<String, AnyObject> {
                self.Email = userDictionary["Email"] as? String
                self.Password = userDictionary["Password"] as? String
                self.Beercred = (userDictionary["Beercred"] as? Int)!
                if let checkBeerchievement = userDictionary["Beerchievements"] as? Dictionary<String, Int>{
                    self.EarnedBeerchievements = checkBeerchievement
                }
                if let checkBeersHad = userDictionary["BeersHad"] as? Dictionary<String, Int>{
                    self.BeersHad = checkBeersHad
                }
            }
        })
 
    }
}
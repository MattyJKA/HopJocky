//
//  BaseService.swift
//  HopJocky
//
//  Created by Matt Union on 3/9/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL = "https://hopjocky.firebaseio.com"

let FIREBASE_REF = Firebase(url: BASE_URL)
let USERS_REF = Firebase(url: "\(BASE_URL)/users")
let BARS_REF = Firebase(url: "\(BASE_URL)/Bars")

//user object for global use
var user: User?

var CURRENT_USER: Firebase{
    let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
    
    let currentUser = Firebase(url: "\(FIREBASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
    
    return currentUser!
}

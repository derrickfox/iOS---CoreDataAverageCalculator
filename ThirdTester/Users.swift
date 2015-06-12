//
//  Users.swift
//  SecondTester
//
//  Created by Derrick Fox on 2/24/15.
//  Copyright (c) 2015 Derrick Fox. All rights reserved.
//

import UIKit
import CoreData

@objc(Users)
class Users: NSManagedObject {
    
    @NSManaged var username:String
    @NSManaged var password:String
    @NSManaged var money:Double
    
    func toString() -> String{
        return "The user name is \(username) their password is \(password)"
    }
    
    func addFunnyPrefix(prefix: String){
        username = prefix + username
    }
    
    func displayName(lble: UILabel){
        lble.text = username
    }
    
    func displayPassword(pasr: UILabel){
        pasr.text = password
    }
    
    func displayMoney(mon: UILabel){
        mon.text = String(format:"%f", money)
    }
    
}

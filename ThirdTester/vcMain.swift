//
//  vcMain.swift
//  SecondTester
//
//  Created by Derrick Fox on 2/24/15.
//  Copyright (c) 2015 Derrick Fox. All rights reserved.
//

import UIKit
import CoreData

class vcMain: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtMoney: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    
    @IBAction func btnSave_Clicked(sender: AnyObject) {
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let ent = NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
        
        var newUser = Users(entity: ent!, insertIntoManagedObjectContext: context)
        newUser.username = txtUsername.text
        newUser.password = txtPassword.text
        newUser.money = (txtMoney.text as NSString).doubleValue
        
        context.save(nil)
        
        println(newUser)
        println("It worked")
                
    }
    
    @IBAction func btnLoad_Clicked(sender: AnyObject) {
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format: "username = %@", txtUsername.text)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        if results.count > 0 {
            for user in results{
                var thisUser = user as! Users
                thisUser.displayName(nameLabel)
                thisUser.displayPassword(passwordLabel)
                thisUser.displayMoney(moneyLabel)
            }
            println("\(results.count) found!")
        }else{
            println("No results found")
        }
        
        
        
        /*
        var total = 0
        var turns = results.count
        var average = 0
        for person in results {
            var amount = 0.0
            amount = person.money
            total = (amount as Double) + (total as Double)
        }
        average = total / turns
        var totalString:String = String(format:"%f", total)
        averageLabel.text = totalString
        println(totalString)
        */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

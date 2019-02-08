//
//  ViewController.swift
//  Udemy20 Core Data
//
//  Created by Brian Sakhuja on 9/23/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext // manager variable. use context to access core data
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("kirsten", forKey: "username")
        newUser.setValue("mypass", forKey: "password")
        newUser.setValue("35", forKey: "age")
        
        do
        {
            try context.save()
            print("saved")
        }
        catch
        {
            print("error happened")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    if let username = result.value(forKey: "username") as? String
                    {
                        print(username)
                    }
                }
            }
            else
            {
                print("no results")
            }
        }
        catch
        {
            print("couldn't fetch results")
        }
        
    }


}


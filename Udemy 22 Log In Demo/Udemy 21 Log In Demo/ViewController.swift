//
//  ViewController.swift
//  Udemy 21 Log In Demo
//
//  Created by Brian Sakhuja on 9/23/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            for result in results as! [NSManagedObject]
            {
                if let username = result.value(forKey: "username") as? String
                {
                    textField.alpha = 0
                    loginButton.alpha = 0
                    label.alpha = 1
                    label.text = "Hi there, \(username)!"
                }
            }
        }
        catch
        {
            print("Failed to log in")
        }
    }

    @IBAction func login(_ sender: Any)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newValue = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newValue.setValue(textField.text, forKey: "name")
        
        do
        {
            try context.save()
            textField.alpha = 0
            loginButton.alpha = 0
            label.alpha = 1
            label.text = "Hi there, \(textField.text!)!"
            
        }
        catch
        {
            print("Failed to save")
        }
        
    }
    
}


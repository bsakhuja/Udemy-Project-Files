//
//  SecondViewController.swift
//  Udemy7 Todo List
//
//  Created by Brian Sakhuja on 8/22/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{
    var todoList = [String]()
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let listObject = UserDefaults.standard.object(forKey: "todoList")
        if let items = listObject  as? [String]
        {
            todoList = items
        }
    }

    @IBAction func addTodoPressed(_ sender: Any)
    {
        if let todoText = textField.text
        {
            todoList.append(todoText)
            UserDefaults.standard.set(todoList, forKey: "todoList")
        }
        
        textField.text = ""
        self.view.endEditing(true)
    }
    
}

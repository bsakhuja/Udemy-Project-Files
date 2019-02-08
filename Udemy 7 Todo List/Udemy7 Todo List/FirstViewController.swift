//
//  ViewController.swift
//  Udemy7 Todo List
//
//  Created by Brian Sakhuja on 8/22/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    var todoList = [String]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let todoText = todoList[indexPath.row]
        cell.textLabel?.text = todoText

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            todoList.remove(at: indexPath.row)
            tableView.reloadData()
            UserDefaults.standard.set(todoList, forKey: "todoList")
            
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    
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
        tableView.reloadData()
    }
    
    


}


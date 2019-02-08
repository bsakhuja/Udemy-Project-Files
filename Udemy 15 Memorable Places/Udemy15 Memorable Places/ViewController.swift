//
//  ViewController.swift
//  Udemy15 Memorable Places
//
//  Created by Brian Sakhuja on 9/19/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

var places = [Dictionary<String, String>()]
var activePlace = -1

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if places.count == 1 && places[0].count == 0
        {
            places.remove(at: 0)
            places.append(["name": "Taj Mahal", "lat":"27.175277", "lon":"78.042128"])
        }
        
        activePlace = -1
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let name = places[indexPath.row]["name"]
        {
            cell.textLabel?.text = name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activePlace = indexPath.row
        performSegue(withIdentifier: "toMap", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            places.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }


}


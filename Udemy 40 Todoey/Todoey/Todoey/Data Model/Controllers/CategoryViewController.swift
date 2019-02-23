//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Brian Sakhuja on 2/22/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: SwipeTableViewController {

    
    
    let realm = try! Realm()
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    
    
    // MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let color = categories?[indexPath.row].color {
            cell.backgroundColor = UIColor(hexString: color)
            cell.textLabel?.textColor = UIColor.contrastingBlackOrWhiteColorOn(UIColor(hexString: color), isFlat: true, alpha: 1)
            
        }
        

        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // go to corresponding category
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            if let category = categories?[indexPath.row] {
                destinationVC.selectedCategory = category
            }
            
        }
    }
    
    // MARK: - Data Manipulation Methods
    

    // Add Category
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            // what will happen once the user clicks the "Add Item" button on our UIAlert
            
            if let newCategoryString = textField.text {
                let newCategory = Category()
                newCategory.name = newCategoryString
                newCategory.color = UIColor.randomFlatColor()?.hexString ?? "1D98F6"
                
                self.save(category: newCategory)
                
                self.tableView.reloadData()
            }
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - Realm CRUD Methods
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("error saving in realm: \(error)")
        }
    }
    
    func loadCategories() {
        categories = realm.objects(Category.self)
        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        do {
            try self.realm.write {
                if let category = self.categories?[indexPath.row] {
                    self.realm.delete(category)
                }
                
            }
        } catch {
            print("error deleting cell: \(error)")
        }

    }
}


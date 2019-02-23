//
//  ViewController.swift
//  Todoey
//
//  Created by Brian Sakhuja on 2/19/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import UIKit
import RealmSwift

class TodoListViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    var todoItems: Results<Item>?
    var selectedCategory : Category? {
        didSet {
            loadItems()
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedCategory?.name
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let colorHex = selectedCategory?.color else { fatalError() }
        updateNavBar(withHexCode: colorHex)
        
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        updateNavBar(withHexCode: "1D9BF6")
        
    }
    
    // MARK: - NavBar setup
    func updateNavBar(withHexCode colorHexCode: String) {
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation controller does not exist") }
        
        let uiColorFromHex = UIColor(hexString: colorHexCode)
        let contrastingColor = UIColor.contrastingBlackOrWhiteColorOn(uiColorFromHex, isFlat: true, alpha: 1)
        navBar.barTintColor = uiColorFromHex
        navBar.tintColor = contrastingColor
        self.navigationItem.rightBarButtonItem?.tintColor = contrastingColor
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : contrastingColor]
        
        searchBar.barTintColor = uiColorFromHex
        
    }
    
    // MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)

        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            
            let color = UIColor(hexString: selectedCategory!.color).darken(by: 100 * (CGFloat(indexPath.row) / CGFloat(todoItems!.count)))
            cell.backgroundColor = color
            cell.textLabel?.textColor = UIColor.contrastingBlackOrWhiteColorOn(color, isFlat: true, alpha: 1)
            
            
            
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No items added"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    // MARK: - TableView Delegate Methods

    // Mark item as completed/uncompleted by tapping cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    item.done = !item.done
                }
            } catch {
                print("\(error)")
            }
        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Add New Item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks the "Add Item" button on our UIAlert
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        if let newItemString = textField.text {
                            let newItem = Item()
                            newItem.title = newItemString
                            newItem.dateCreated = Date()
                            currentCategory.items.append(newItem)
                        }
                    }
                } catch {
                    print("Error saving new items: \(error)")
                }
            }
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

    // MARK: - Realm CRUD methods
    func loadItems() {
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)

        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        do {
            try self.realm.write {
                if let item = self.todoItems?[indexPath.row] {
                    self.realm.delete(item)
                }
            }
        } catch {
            print("error deleting cell: \(error)")
        }

    }
    
    
}

// MARK: - UISearchBar delegate methods
extension TodoListViewController: UISearchBarDelegate {

    // User clicks the search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchBarText = searchBar.text {
            todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBarText).sorted(byKeyPath: "dateCreated", ascending: true)
            tableView.reloadData()
        }
    }

    // User clears the search text field
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()

            // Dismiss keyboard on main thread
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }

        }
    }
}

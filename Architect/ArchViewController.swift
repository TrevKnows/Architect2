//
//  ViewController.swift
//  Architect
//
//  Created by Trevor Beaton on 2/28/18.
//  Copyright © 2018 Vanguard Logic LLC. All rights reserved.
//

import UIKit

class ArchViewController: UITableViewController {
  
  var itemArray = ["A","B"]
 
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "archItemCell", for: indexPath)
    
    cell.textLabel?.text = itemArray[indexPath.row]
    
    return cell
  }
  //Delegate methods
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //print(itemArray[indexPath.row])
    
    
    
    if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
      tableView.cellForRow(at: indexPath)?.accessoryType = .none
    } else {
      tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    
    tableView.deselectRow(at: indexPath, animated: true)
    

  }
  
  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
    var textField = UITextField()
    
    let alert =  UIAlertController(title: "New Architect Note", message: "", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
      //What will happen once the user clicks the Add Item button

      self.itemArray.append(textField.text!)
      
      self.tableView.reloadData()

      
    }
    
    alert.addTextField { (alertTextField) in
      alertTextField.placeholder = "Create new item"
      textField = alertTextField
      
      
    }
    
    
    alert.addAction(action)
    
    
    present(alert, animated: true, completion: nil)
    
    
  }
  
  
}


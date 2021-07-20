//
//  InventoryTableViewController.swift
//  InventoryApp
//
//  Created by Yuriy Martinovskiy on 13.07.2021.
//

import UIKit
import CoreData

class InventoryTableViewController: UITableViewController {
    
    var equipments: [Equipment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Equipment> = Equipment.fetchRequest()
        
        do {
            equipments = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func addEquipment(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toEquipmentCard", sender: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return equipments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.modelEquipment.text = equipments[indexPath.row].model
        cell.serialNumberEquipment.text = equipments[indexPath.row].serialNumber
        cell.ownerEquipment.text = "Ivanov Andrey Fedorovich"
        cell.inventoryNumberEquipment.text = equipments[indexPath.row].inventoryNumber
        cell.logoEquipment.image = UIImage(systemName: "desktopcomputer")

        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let currentList = equipments[indexPath.row]
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let deleteAction = UIContextualAction(style: .destructive,
                                              title: "Delete") { _, _, _  in
            
            context.delete(currentList)
            do {
                try context.save()
                self.equipments.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        let editAction = UIContextualAction(style: .normal,
                                              title: "Edit") { _, _, _  in
            
            context.delete(currentList)
            do {
                try context.save()
                self.equipments.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        editAction.backgroundColor = .green
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

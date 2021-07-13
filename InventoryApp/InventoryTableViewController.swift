//
//  InventoryTableViewController.swift
//  InventoryApp
//
//  Created by Yuriy Martinovskiy on 13.07.2021.
//

import UIKit

class InventoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.modelEquipment.text = "INTEL DH77EB"
        cell.serialNumberEquipment.text = "S/N: GEBN6510066934"
        cell.ownerEquipment.text = "Ivanov Andrey Fedorovich"
        cell.inventoryNumberEquipment.text = "101345"
        cell.logoEquipment.image = UIImage(systemName: "desktopcomputer")

        return cell
    }
}

//
//  EquipmentCardViewController.swift
//  InventoryApp
//
//  Created by Yuriy Martinovskiy on 13.07.2021.
//

import UIKit
import CoreData

class EquipmentCardViewController: UIViewController {
    
    var equipments: [Equipment] = []
    
    @IBOutlet weak var inventoryNumber: UITextField!
    @IBOutlet weak var typeEquipment: UITextField!
    @IBOutlet weak var modelEquipment: UITextField!
    @IBOutlet weak var serialNumberEquipment: UITextField!
    @IBOutlet weak var dateOfCreation: UITextField!
    
    @IBOutlet weak var surnamePerson: UITextField!
    @IBOutlet weak var namePerson: UITextField!
    @IBOutlet weak var departmentPerson: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pressSaveButton(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Equipment", in: context) else { return }
        
        let equipmentObject = Equipment(entity: entity, insertInto: context)
        equipmentObject.type = typeEquipment.text
        equipmentObject.model = modelEquipment.text
        equipmentObject.inventoryNumber = inventoryNumber.text
        equipmentObject.serialNumber = serialNumberEquipment.text
        
        do {
            try context.save()
            equipments.append(equipmentObject)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

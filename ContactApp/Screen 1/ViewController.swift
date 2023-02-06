//
//  ViewController.swift
//  ContactApp
//
//  Created by Daniela Manole on 05.02.2023.
//

import UIKit

class ViewController: UIViewController {
    let database = DatabaseHandler()
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //database.deleteAllData(Contact.self)
        APIHandler.shared.syncContacts() {

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //fetching data from Core Data everytime we open the screen
        contacts = database.fetch(Contact.self)
        contacts.forEach { contact in
            print(contact.id)
        }
    }
}

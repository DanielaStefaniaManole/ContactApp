//
//  AllContactsViewController.swift
//  ContactApp
//
//  Created by Daniela Manole on 05.02.2023.
//

import UIKit

class AllContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as? ContactCell
        cell?.contactNameLabel?.text = "Dani"
        return cell!
    }
    
    @IBOutlet weak private var addContactButton: UIButton!
    @IBOutlet weak private var tableView: UITableView!
    
    let database = DatabaseHandler()
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //database.deleteAllData(Contact.self)
        APIHandler.shared.syncContacts() {

        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ContactCell")
        
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //fetching data from Core Data everytime we open the screen
        contacts = database.fetch(Contact.self)
        contacts.forEach { contact in
            print(contact.id)
        }
        
        setupUI()
    }
    
    private func setupUI() {
        addContactButton.backgroundColor = .clear
        addContactButton.layer.cornerRadius = 7
        addContactButton.layer.borderWidth = 2
        addContactButton.layer.borderColor = UIColor(named: "Background")?.cgColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //database.deleteAllData(Contact.self)
    }
}

extension AllContactsViewController: UIScrollViewDelegate {
    
}

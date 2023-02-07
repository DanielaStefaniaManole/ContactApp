//
//  AllContactsViewController.swift
//  ContactApp
//
//  Created by Daniela Manole on 05.02.2023.
//

import UIKit

class AllContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak private var addContactButton: UIButton!
    @IBOutlet weak private var tableView: UITableView!
    
    let database = DatabaseHandler()
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        database.deleteAllData(Contact.self)  // for deleting all entries
//        APIHandler.shared.syncContacts() {    // called just once to store data in cache
//
//        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.selectionFollowsFocus = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //fetching data from Core Data everytime we open the screen
        contacts = database.fetch(Contact.self)
        
        setupUI()
    }
    
    private func setupUI() {
        addContactButton.backgroundColor = .clear
        addContactButton.layer.cornerRadius = 7
        addContactButton.layer.borderWidth = 2
        addContactButton.layer.borderColor = UIColor(named: "Background")?.cgColor
        
        addContactButton.addTarget(self, action: #selector(addContactScreen), for: .touchUpInside)
    }
    
    @objc func addContactScreen(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "ContactDetailsViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ContactDetails")
        vc.modalPresentationStyle = .fullScreen
        vc.isModalInPresentation = true
        self.present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as? ContactCell
        cell?.setup(element: contacts[indexPath.row])
        cell?.selectionStyle = .none
        cell?.viewDetailsButton.addTarget(self, action: #selector(addContactScreen), for: .touchUpInside)
        return cell!
    }
}

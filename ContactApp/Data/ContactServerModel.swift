//
//  ContactServerModel.swift
//  ContactMe
//
//  Created by Daniela Manole on 05.02.2023.
//

import Foundation

struct ContactServerModel: Codable {
    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: String
    
    static let database = DatabaseHandler()
    
    func store() {
        guard let contact = ContactServerModel.database.add(Contact.self) else { return }
        
        contact.id = Int64(id)
        contact.name = name
        contact.email = email
        contact.gender = gender
        contact.status = status
        
        ContactServerModel.database.save()
    }
}

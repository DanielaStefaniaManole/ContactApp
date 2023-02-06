//
//  Contact+CoreDataProperties.swift
//  ContactApp
//
//  Created by Daniela Manole on 05.02.2023.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var status: String?
    @NSManaged public var gender: String?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var id: Int64

}

extension Contact : Identifiable {

}

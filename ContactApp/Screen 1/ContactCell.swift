//
//  ContactCell.swift
//  ContactApp
//
//  Created by Daniela Manole on 07.02.2023.
//

import Foundation
import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var viewDetailsButton: UIButton!
    
    func setup(element: Contact){
//        if element.id % 2 == 0 {
//            contactImageView.image = imageView
//        }
        
        //contactNameLabel.text = element.name
        
        //button action
    }
    
//    @objc
//    func viewDetails() {
//        present screen 2 (contact)
//    }
    
}

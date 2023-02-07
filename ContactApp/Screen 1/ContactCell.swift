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
    
    func setup(element: Contact) {
        if element.id % 2 != 0 {
            if let url = URL(string: "https://picsum.photos/200/200") {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    DispatchQueue.main.async {
                        self.contactImageView.image = UIImage(data: data)
                    }
                }
                task.resume()
            }
        } else {
            createInitialsImage(name: element.name ?? "")
        }
        
        contactImageView?.layer.cornerRadius = 23.0
        contactNameLabel.text = element.name
    }
    
    func createInitialsImage(name: String) {
        let label = UILabel()
        label.frame.size = CGSize(width: 45.0, height: 45.0)
        label.textColor = UIColor.white
        label.font = UIFont(name: "", size: 17.0)
        label.text = getInitials(name: name)
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor(named: "Subtitle text")
        label.layer.cornerRadius = 50.0

        UIGraphicsBeginImageContext(label.frame.size)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        contactImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func getInitials(name: String) -> String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: name) {
             formatter.style = .abbreviated
             return formatter.string(from: components)
        }
        return ""
    }
}

//
//  ContactDetailsViewController.swift
//  ContactApp
//
//  Created by Daniela Manole on 05.02.2023.
//

import Foundation
import UIKit

class ContactDetailsViewController: UIViewController {
    
    @IBOutlet weak private var numeView: UIView!
    @IBOutlet weak private var prenumeView: UIView!
    @IBOutlet weak private var telefonView: UIView!
    @IBOutlet weak private var emailView: UIView!
    
    @IBOutlet weak private var numeTextField: UITextField!
    @IBOutlet weak private var prenumeTextField: UITextField!
    @IBOutlet weak private var telefonTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    
    @IBOutlet weak private var saveButton: UIButton!
    
    let database = DatabaseHandler()
    var viewModel: ContactDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        numeView.layer.cornerRadius = 12.0
        prenumeView.layer.cornerRadius = 12.0
        telefonView.layer.cornerRadius = 12.0
        emailView.layer.cornerRadius = 12.0
        saveButton.layer.cornerRadius = 12.0
        
        numeTextField.underlined(color: UIColor(named: "Background")!)
        prenumeTextField.underlined(color: UIColor(named: "Background")!)
        telefonTextField.underlined(color: UIColor(named: "Background")!)
        emailTextField.underlined(color: UIColor(named: "Background")!)
        
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    }
    
    @objc func save() {
        self.dismiss(animated: true)
    }
    
    func update() {
        
    }
}

extension UITextField {
    func underlined(color: UIColor) {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

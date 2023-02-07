//
//  APIHandler.swift
//  ContactMe
//
//  Created by Daniela Manole on 05.02.2023.
//

import Foundation

class APIHandler {
    static let shared = APIHandler()
    
    func syncContacts(completion: @escaping (() -> Void)) {
        var request = URLRequest(url: URL(string: "https://gorest.co.in/public/v2/users")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let model = try JSONDecoder().decode([ContactServerModel].self, from: data!)
                model.forEach { contact in
                    if contact.status != "inactive" {
                        contact.store()
                    }
                }
                
                completion()
            } catch {
                print(error)
                completion()
            }
        })
        
        task.resume()
    }
}

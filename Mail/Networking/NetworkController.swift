//
//  NetworkController.swift
//  Mail
//
//  Created by Justin on 3/28/20.
//  Copyright © 2020 justncode LLC. All rights reserved.
//

import Foundation

struct NetworkController {
    private static var baseUrl = "https://justncode.com/"
    
    enum Endpoint: String {
        case mailMessages = "json/email.json"
    }
    
    private static func urlString(for endpoint: Endpoint) -> String {
        return baseUrl + endpoint.rawValue
    }
    
    static func fetchMailMessages(_ completion: @escaping (([Mail.Message]) -> Void)) {
        print("fetching from URL", urlString(for: .mailMessages))
        if let url = URL(string: urlString(for: .mailMessages)) {
            URLSession.shared.dataTask(with: url) { (data, reponse, error) in
                // check for error
                if let error = error {
                    print("there was an error...", error)
                }
                
                if let data = data {
                    let mail = try? JSONDecoder().decode(Mail.self, from: data)
                    
                    completion(mail?.messages ?? [])
                }
            }.resume()
        }
    }
}

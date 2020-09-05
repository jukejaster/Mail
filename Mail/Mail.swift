//
//  Mail.swift
//  Mail
//
//  Created by Justin on 3/28/20.
//  Copyright © 2020 justncode LLC. All rights reserved.
//

import Foundation

struct Mail: Decodable {
    var messages: [Message]
    
    struct Message: Decodable {
        var sender: String
        var subject: String
        var body: String
        var timestamp: Double
    }
}

extension Mail.Message {
    var subjectDisplayableValue: String {
        return subject.isEmpty ? "No Subject" : subject
    }
}

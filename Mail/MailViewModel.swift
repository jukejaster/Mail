//
//  MailViewModel.swift
//  Mail
//
//  Created by Justin on 3/28/20.
//  Copyright © 2020 justncode LLC. All rights reserved.
//

import Foundation

class MailViewModel {
    var messages: [Mail.Message] = []
    
    func fetchMailMessages(_ completion: @escaping (() -> Void)) {
        NetworkController.fetchMailMessages { messages in
            self.messages = messages
            completion()
        }
    }
}

//
//  MessageDetailsViewModel.swift
//  Mail
//
//  Created by Justin on 4/4/20.
//  Copyright © 2020 justncode LLC. All rights reserved.
//

import Foundation

struct MessageDetailsViewModel {
    var message: Mail.Message
    
    var navigationBarTitle: String {
        return message.sender
    }
    
    var displayableSubject: String {
        return message.subjectDisplayableValue
    }
    
    var displayableTime: String {
        return message.timestamp.unixTimestampAsMeridiem
    }
    
    var displayableBody: String {
        return message.body
    }
}

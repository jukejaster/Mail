//
//  MessageCell.swift
//  Mail
//
//  Created by Justin on 3/28/20.
//  Copyright © 2020 justncode LLC. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var message: Mail.Message? {
        didSet {
            guard let message = message else { return }
            
            senderLabel.text = message.sender
            subjectLabel.text = message.subjectDisplayableValue
            bodyLabel.text = message.body
            timeLabel.text = message.timestamp.unixTimestampAsMeridiem
        }
    }
}

//
//  Date+MeridiemFormatting.swift
//  Mail
//
//  Created by Justin on 3/28/20.
//  Copyright © 2020 justncode LLC. All rights reserved.
//

import Foundation

extension Date {
    var asMeridiem: String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        return formatter.string(from: self)
    }
}

//
//  Double+MeridiemFormatting.swift
//  Mail
//
//  Created by Justin on 3/28/20.
//  Copyright © 2020 justncode LLC. All rights reserved.
//

import Foundation

extension Double {
    var unixTimestampAsMeridiem: String {
        return Date(timeIntervalSince1970: self).asMeridiem
    }
}

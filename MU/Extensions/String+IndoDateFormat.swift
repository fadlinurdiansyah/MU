//
//  Date+IndonesianFormat.swift
//  MU
//
//  Created by NDS on 02/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

extension String {
    
    // Convert date string to indonesian date format
    // example new format (Jum, 10 Agt 2018)
    func indoDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd"
        let newFormat = DateFormatter()
        newFormat.calendar = Calendar(identifier: .iso8601)
        newFormat.locale = Locale(identifier: "id_ID")
        newFormat.timeZone = .current
        newFormat.dateFormat = "EEE, dd MMM YYYY"
        if let date = dateFormatter.date(from: self) {
            return newFormat.string(from: date)
        } else {
            return ""
        }
    }
    
}

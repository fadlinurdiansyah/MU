//
//  String+SqlDateFormat.swift
//  MU
//
//  Created by NDS on 04/07/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

extension String {
    
    func sqlDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let newFormat = DateFormatter()
        newFormat.calendar = Calendar(identifier: .iso8601)
        newFormat.locale = Locale(identifier: "id_ID")
        newFormat.timeZone = .current
        newFormat.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            return newFormat.string(from: date)
        } else {
            return ""
        }
    }
}

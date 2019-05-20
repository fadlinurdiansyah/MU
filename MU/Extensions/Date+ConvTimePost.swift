//
//  Date+ConvTimePost.swift
//  MU
//
//  Created by NDS on 20/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation


extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        var result: String = ""
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week
        let year = 12 * month
        
        if secondsAgo < minute {
            result = "\(secondsAgo) Detik yang lalu"
        } else if secondsAgo < hour {
            result = "\(secondsAgo / minute) Menit yang lalu"
        } else if secondsAgo < day {
            result = "\(secondsAgo / hour) Jam yang lalu"
        } else if secondsAgo < week {
            result = "\(secondsAgo / day) Hari yang lalu"
        } else if secondsAgo < month {
            result = "\(secondsAgo / week) Minggu yang lalu"
        } else if secondsAgo < year {
            result = "\(secondsAgo / month) Bulan yang lalu"
        } else if secondsAgo < year * 10 {
            result = "\(secondsAgo / year) Tahun yang lalu"
        } else {
            result = "Sedekade yang lalu"
        }
        return result
    }
}

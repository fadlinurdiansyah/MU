//
//  ColorConstants.swift
//  MU
//
//  Created by fadielse on 11/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

struct ColorConstants {
    
    static let primaryRed = UIColor(hex: 0xC70101)
}

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0x0000FF)) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

//
//  UIColor+RGB.swift
//  MU
//
//  Created by NDS on 31/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        
    }
    
    static func rgbAlpha(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
        
    }
}

//
//  NavigationBar+Style.swift
//  MU
//
//  Created by NDS on 18/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func setTitleFont(font: UIFont, color: UIColor = .black ) {
        
        var attrs = [NSAttributedString.Key: Any]()
        attrs[.font] = font
        attrs[.foregroundColor] = color
        titleTextAttributes = attrs
    }
    
    func makeTransparant() {
        
        isTranslucent = true
        backgroundColor = .clear
        barTintColor = .clear
        setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        tintColor = UIColor.white
        titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        shadowImage = UIImage()
        
    }
    
    func setColors(backgroundWithColor backColor: UIColor, textWithColor textColor: UIColor) {
        
        isTranslucent = false
        setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        shadowImage = nil
        backgroundColor = backColor
        barTintColor = backColor
        tintColor = backColor
        titleTextAttributes = [NSAttributedString.Key.foregroundColor: textColor]
        
    }
    
}

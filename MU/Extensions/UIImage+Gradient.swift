//
//  UIImage+Gradient.swift
//  MU
//
//  Created by NDS on 26/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

extension UIImage {
    
    func imageWithGradient() -> UIImage {
        
        UIGraphicsBeginImageContext(self.size)
        let context = UIGraphicsGetCurrentContext()
        
        self.draw(at: CGPoint(x: 0, y: 0))
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [1.0, 0.5]
        
        //Location untuk horizontal gradient [x , y]
        //        let locations: [CGFloat] = [0.0, 1.0]
        
        let bottomColor = UIColor.clear.cgColor
        let topColor = UIColor.black.cgColor
        let colors = [topColor, bottomColor] as CFArray
        
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations )
        
        let startPoint = CGPoint(x: self.size.width / 2, y: 0)
        let endPoint = CGPoint(x: self.size.width / 2, y: self.size.height)
        
        //Horizontal Gradient
        //        let startPoint = CGPoint(x: 0, y: img.size.height / 2)
        //        let endPoint = CGPoint(x: 50, y: img.size.height / 2)
        
        //        print("width \(img.size.width) & height \(img.size.height)")
        
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
    }
    
}

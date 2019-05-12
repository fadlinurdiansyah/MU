//  NSLayoutHelper.swift
//  Layout Helper
//
//  Created by Wabbiters on 4/15/19.
//  Copyright © 2019 Wabbiters. All rights reserved.

import UIKit

@IBDesignable class NSLayoutHelper: NSLayoutConstraint {
    
    @IBInspectable var iPhone4s: CGFloat = 0.0 {
        didSet { deviceConstant(.i35Inch, value: iPhone4s) }
    }
    @IBInspectable var iPhoneSE: CGFloat = 0.0 {
        didSet { deviceConstant(.i4Inch, value: iPhoneSE) }
    }
    @IBInspectable var iPhone8: CGFloat = 0.0 {
        didSet { deviceConstant(.i47Inch, value: iPhone8) }
    }
    @IBInspectable var iPhone8Plus: CGFloat = 0.0 {
        didSet { deviceConstant(.i55Inch, value: iPhone8Plus) }
    }
    @IBInspectable var iPhoneXS: CGFloat = 0.0 {
        didSet { deviceConstant(.i58Inch, value: iPhoneXS) }
    }
    @IBInspectable var iPhoneXR: CGFloat = 0.0 {
        didSet { deviceConstant(.i61Inch, value: iPhoneXR) }
    }
    @IBInspectable var iPhoneXMax: CGFloat = 0.0 {
        didSet { deviceConstant(.i65Inch, value: iPhoneXMax) }
    }
    @IBInspectable var iPadMini: CGFloat = 0.0 {
        didSet { deviceConstant(.i79Inch, value: iPadMini) }
    }
    @IBInspectable var iPadPro97: CGFloat = 0.0 {
        didSet { deviceConstant(.i97Inch, value: iPadPro97) }
    }
    @IBInspectable var iPadPro105: CGFloat = 0.0 {
        didSet { deviceConstant(.i105Inch, value: iPadPro105) }
    }
    @IBInspectable var iPadPro129: CGFloat = 0.0 {
        didSet { deviceConstant(.i129Inch, value: iPadPro129) }
    }
    
    // Helpers
    open func deviceConstant(_ device: UIDeviceSize, value: CGFloat) {
        if deviceSize == device {
            constant = value
        }
    }
}

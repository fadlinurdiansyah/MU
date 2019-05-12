//
//  UITextfieldHelper.swift
//  Constraint test
//
//  Created by ajm on 4/15/19.
//  Copyright © 2019 Dream begin. All rights reserved.
//
import UIKit

@IBDesignable class UITextfieldHelper: UITextField {
    
    @IBInspectable var iPhone4s: CGFloat = 0.0 {
        didSet { deviceFont(.i35Inch, value: iPhone4s) }
    }
    @IBInspectable var iPhoneSE: CGFloat = 0.0 {
        didSet { deviceFont(.i4Inch, value: iPhoneSE) }
    }
    @IBInspectable var iPhone8: CGFloat = 0.0 {
        didSet { deviceFont(.i47Inch, value: iPhone8) }
    }
    @IBInspectable var iPhone8Plus: CGFloat = 0.0 {
        didSet { deviceFont(.i55Inch, value: iPhone8Plus) }
    }
    @IBInspectable var iPhoneXS: CGFloat = 0.0 {
        didSet { deviceFont(.i58Inch, value: iPhoneXS) }
    }
    @IBInspectable var iPhoneXR: CGFloat = 0.0 {
        didSet { deviceFont(.i61Inch, value: iPhoneXR) }
    }
    @IBInspectable var iPhoneXMax: CGFloat = 0.0 {
        didSet { deviceFont(.i65Inch, value: iPhoneXMax) }
    }
    @IBInspectable var iPadMini: CGFloat = 0.0 {
        didSet { deviceFont(.i79Inch, value: iPadMini) }
    }
    @IBInspectable var iPadPro97: CGFloat = 0.0 {
        didSet { deviceFont(.i97Inch, value: iPadPro97) }
    }
    @IBInspectable var iPadPro105: CGFloat = 0.0 {
        didSet { deviceFont(.i105Inch, value: iPadPro105) }
    }
    @IBInspectable var iPadPro129: CGFloat = 0.0 {
        didSet { deviceFont(.i129Inch, value: iPadPro129) }
    }
    
    // Helpers
    open func deviceFont(_ device: UIDeviceSize, value: CGFloat) {
        if deviceSize == device {
            if let font = font {
                self.font = UIFont(descriptor: font.fontDescriptor, size: value)
                layoutIfNeeded()
            }
        }
        
    }
}

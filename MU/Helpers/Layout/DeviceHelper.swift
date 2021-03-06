//  Layout Helper
//
//  Created by Wabbiters on 4/15/19.
//  Copyright © 2019 Wabbiters. All rights reserved.

import UIKit

enum UIDeviceSize {
    case i35Inch
    case i4Inch
    case i47Inch
    case i55Inch
    case i58Inch
    case i61Inch
    case i65Inch
    case i79Inch
    case i97Inch
    case i105Inch
    case i129Inch
    case unknown
}

let deviceSize: UIDeviceSize = {
    let width: Double = Double(UIScreen.main.bounds.width)
    let height: Double = Double(UIScreen.main.bounds.height)
    let screenHeight: Double = max(width, height)
    
    switch screenHeight {
    case 480:
        return .i35Inch
    case 568:
        return .i4Inch
    case 667:
        return UIScreen.main.scale == 3.0 ? .i55Inch : .i47Inch
    case 736:
        return .i55Inch
    case 812:
        return .i58Inch
    case 896:
        switch UIDevice().type {
        case .iPhoneXSMax:
            return .i65Inch
        default:
            return .i61Inch
        }
    case 1024:
        switch UIDevice().type {
        case .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4:
            return .i79Inch
        case .iPadPro105:
            return .i105Inch
        default:
            return .i97Inch
        }
    case 1112:
        return .i105Inch
    case 1366:
        return .i129Inch
    default:
        return .unknown
    }
    
}()

// This Model and Extention has been taken from the Answer by
// Alessandro Ornano : https://stackoverflow.com/a/46234519/6330448
// Feel free to update it
public enum Model: String {
    case simulator     = "simulator/sandbox",
    //iPod
    iPod1              = "iPod 1",
    iPod2              = "iPod 2",
    iPod3              = "iPod 3",
    iPod4              = "iPod 4",
    iPod5              = "iPod 5",
    //iPad
    iPad2              = "iPad 2",
    iPad3              = "iPad 3",
    iPad4              = "iPad 4",
    iPadAir            = "iPad Air ",
    iPadAir2           = "iPad Air 2",
    iPad5              = "iPad 5", //aka iPad 2017
    iPad6              = "iPad 6", //aka iPad 2018
    //iPad mini
    iPadMini           = "iPad Mini",
    iPadMini2          = "iPad Mini 2",
    iPadMini3          = "iPad Mini 3",
    iPadMini4          = "iPad Mini 4",
    //iPad pro
    iPadPro97         = "iPad Pro 9.7\"",
    iPadPro105        = "iPad Pro 10.5\"",
    iPadPro129        = "iPad Pro 12.9\"",
    iPadPro2129      = "iPad Pro 2 12.9\"",
    //iPhone
    iPhone4            = "iPhone 4",
    iPhone4S           = "iPhone 4S",
    iPhone5            = "iPhone 5",
    iPhone5S           = "iPhone 5S",
    iPhone5C           = "iPhone 5C",
    iPhone6            = "iPhone 6",
    iPhone6plus        = "iPhone 6 Plus",
    iPhone6S           = "iPhone 6S",
    iPhone6Splus       = "iPhone 6S Plus",
    iPhoneSE           = "iPhone SE",
    iPhone7            = "iPhone 7",
    iPhone7plus        = "iPhone 7 Plus",
    iPhone8            = "iPhone 8",
    iPhone8plus        = "iPhone 8 Plus",
    iPhoneX            = "iPhone X",
    iPhoneXS           = "iPhone XS",
    iPhoneXSMax        = "iPhone XS Max",
    iPhoneXR           = "iPhone XR",
    //Apple TV
    appleTV            = "Apple TV",
    appleTV4K         = "Apple TV 4K",
    unrecognized       = "?unrecognized?"
}
public extension UIDevice {
    var type: Model {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {  ptr in String.init(validatingUTF8: ptr) }
        }
        var modelMap: [ String: Model ] = [
            "i386": .simulator,
            "x86_64": .simulator,
            //iPod
            "iPod1,1": .iPod1,
            "iPod2,1": .iPod2,
            "iPod3,1": .iPod3,
            "iPod4,1": .iPod4,
            "iPod5,1": .iPod5,
            //iPad
            "iPad2,1": .iPad2,
            "iPad2,2": .iPad2,
            "iPad2,3": .iPad2,
            "iPad2,4": .iPad2,
            "iPad3,1": .iPad3,
            "iPad3,2": .iPad3,
            "iPad3,3": .iPad3,
            "iPad3,4": .iPad4,
            "iPad3,5": .iPad4,
            "iPad3,6": .iPad4,
            "iPad4,1": .iPadAir,
            "iPad4,2": .iPadAir,
            "iPad4,3": .iPadAir,
            "iPad5,3": .iPadAir2,
            "iPad5,4": .iPadAir2,
            "iPad6,11": .iPad5, //aka iPad 2017
            "iPad6,12": .iPad5,
            "iPad7,5": .iPad6, //aka iPad 2018
            "iPad7,6": .iPad6,
            //iPad mini
            "iPad2,5": .iPadMini,
            "iPad2,6": .iPadMini,
            "iPad2,7": .iPadMini,
            "iPad4,4": .iPadMini2,
            "iPad4,5": .iPadMini2,
            "iPad4,6": .iPadMini2,
            "iPad4,7": .iPadMini3,
            "iPad4,8": .iPadMini3,
            "iPad4,9": .iPadMini3,
            "iPad5,1": .iPadMini4,
            "iPad5,2": .iPadMini4,
            //iPad pro
            "iPad6,3": .iPadPro97,
            "iPad6,4": .iPadPro97,
            "iPad7,3": .iPadPro105,
            "iPad7,4": .iPadPro105,
            "iPad6,7": .iPadPro129,
            "iPad6,8": .iPadPro129,
            "iPad7,1": .iPadPro2129,
            "iPad7,2": .iPadPro2129,
            //iPhone
            "iPhone3,1": .iPhone4,
            "iPhone3,2": .iPhone4,
            "iPhone3,3": .iPhone4,
            "iPhone4,1": .iPhone4S,
            "iPhone5,1": .iPhone5,
            "iPhone5,2": .iPhone5,
            "iPhone5,3": .iPhone5C,
            "iPhone5,4": .iPhone5C,
            "iPhone6,1": .iPhone5S,
            "iPhone6,2": .iPhone5S,
            "iPhone7,1": .iPhone6plus,
            "iPhone7,2": .iPhone6,
            "iPhone8,1": .iPhone6S,
            "iPhone8,2": .iPhone6Splus,
            "iPhone8,4": .iPhoneSE,
            "iPhone9,1": .iPhone7,
            "iPhone9,3": .iPhone7,
            "iPhone9,2": .iPhone7plus,
            "iPhone9,4": .iPhone7plus,
            "iPhone10,1": .iPhone8,
            "iPhone10,4": .iPhone8,
            "iPhone10,2": .iPhone8plus,
            "iPhone10,5": .iPhone8plus,
            "iPhone10,3": .iPhoneX,
            "iPhone10,6": .iPhoneX,
            "iPhone11,2": .iPhoneXS,
            "iPhone11,4": .iPhoneXSMax,
            "iPhone11,6": .iPhoneXSMax,
            "iPhone11,8": .iPhoneXR,
            //AppleTV
            "AppleTV5,3": .appleTV,
            "AppleTV6,2": .appleTV4K
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!] {
            if model == .simulator {
                if let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                    if let simModel = modelMap[String.init(validatingUTF8: simModelCode)!] {
                        return simModel
                    }
                }
            }
            return model
        }
        return Model.unrecognized
    }
}

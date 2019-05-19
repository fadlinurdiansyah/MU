//
//  UIApplication+statusBar.swift
//  MU
//
//  Created by NDS on 18/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

extension UIApplication {
    
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

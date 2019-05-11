//
//  CustomPage.swift
//  SwiftyOnboardExample
//
//  Created by Jay on 3/27/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import SwiftyOnboard

class CustomPage: SwiftyOnboardPage {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "CustomPage", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
}

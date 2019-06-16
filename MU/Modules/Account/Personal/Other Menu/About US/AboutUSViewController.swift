//
//  AboutUSViewController.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum AboutUS {
        // TODO: Add segue ids
    }
}

class AboutUSViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: AboutUSPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AboutUSPresenter.config(withAboutUSViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AboutUSViewController: AboutUSView {
    // TODO: implement view methods
}

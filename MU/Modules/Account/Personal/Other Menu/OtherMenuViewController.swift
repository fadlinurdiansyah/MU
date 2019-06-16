//
//  OtherMenuViewController.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum OtherMenu {
        // TODO: Add segue ids
    }
}

class OtherMenuViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: OtherMenuPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        OtherMenuPresenter.config(withOtherMenuViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OtherMenuViewController: OtherMenuView {
    // TODO: implement view methods
}

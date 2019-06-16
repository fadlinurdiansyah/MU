//
//  AddNobarViewController.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum AddNobar {
        // TODO: Add segue ids
    }
}

class AddNobarViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: AddNobarPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AddNobarPresenter.config(withAddNobarViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AddNobarViewController: AddNobarView {
    // TODO: implement view methods
}

//
//  AddLocationNobarViewController.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum AddLocationNobar {
        // TODO: Add segue ids
    }
}

class AddLocationNobarViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: AddLocationNobarPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AddLocationNobarPresenter.config(withAddLocationNobarViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AddLocationNobarViewController: AddLocationNobarView {
    // TODO: implement view methods
}

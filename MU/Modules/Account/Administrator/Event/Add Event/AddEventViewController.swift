//
//  AddEventViewController.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum AddEvent {
        // TODO: Add segue ids
    }
}

class AddEventViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: AddEventPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AddEventPresenter.config(withAddEventViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AddEventViewController: AddEventView {
    // TODO: implement view methods
}

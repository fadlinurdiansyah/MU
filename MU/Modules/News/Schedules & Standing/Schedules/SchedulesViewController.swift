//
//  SchedulesViewController.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum Schedules {
        // TODO: Add segue ids
    }
}

class SchedulesViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: SchedulesPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SchedulesPresenter.config(withSchedulesViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SchedulesViewController: SchedulesView {
    // TODO: implement view methods
}

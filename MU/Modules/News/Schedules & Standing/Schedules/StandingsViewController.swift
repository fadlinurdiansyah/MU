//
//  StandingsViewController.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum Standings {
        // TODO: Add segue ids
    }
}

class StandingsViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: StandingsPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        StandingsPresenter.config(withStandingsViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension StandingsViewController: StandingsView {
    // TODO: implement view methods
}

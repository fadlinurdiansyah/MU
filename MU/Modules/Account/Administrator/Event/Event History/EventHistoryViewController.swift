//
//  EventHistoryViewController.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum EventHistory {
        // TODO: Add segue ids
    }
}

class EventHistoryViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: EventHistoryPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        EventHistoryPresenter.config(withEventHistoryViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension EventHistoryViewController: EventHistoryView {
    // TODO: implement view methods
}

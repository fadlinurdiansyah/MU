//
//  NobarHistoryViewController.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum NobarHistory {
        // TODO: Add segue ids
    }
}

class NobarHistoryViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: NobarHistoryPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NobarHistoryPresenter.config(withNobarHistoryViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NobarHistoryViewController: NobarHistoryView {
    // TODO: implement view methods
}

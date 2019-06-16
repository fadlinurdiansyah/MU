//
//  YourMenuHistoryViewController.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum YourMenuHistory {
        // TODO: Add segue ids
    }
}

class YourMenuHistoryViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: YourMenuHistoryPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        YourMenuHistoryPresenter.config(withYourMenuHistoryViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension YourMenuHistoryViewController: YourMenuHistoryView {
    // TODO: implement view methods
}

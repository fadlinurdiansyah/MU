//
//  YourMenuTransactionViewController.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum YourMenuTransaction {
        // TODO: Add segue ids
    }
}

class YourMenuTransactionViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: YourMenuTransactionPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        YourMenuTransactionPresenter.config(withYourMenuTransactionViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension YourMenuTransactionViewController: YourMenuTransactionView {
    // TODO: implement view methods
}

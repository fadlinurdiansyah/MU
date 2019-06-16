//
//  HistoryMerchandiseViewController.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum HistoryMerchandise {
        // TODO: Add segue ids
    }
}

class HistoryMerchandiseViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: HistoryMerchandisePresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        HistoryMerchandisePresenter.config(withHistoryMerchandiseViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HistoryMerchandiseViewController: HistoryMerchandiseView {
    // TODO: implement view methods
}

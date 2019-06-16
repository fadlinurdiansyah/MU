//
//  MerchandiseTranDetailViewController.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum MerchandiseTranDetail {
        // TODO: Add segue ids
    }
}

class MerchandiseTranDetailViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: MerchandiseTranDetailPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MerchandiseTranDetailPresenter.config(withMerchandiseTranDetailViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MerchandiseTranDetailViewController: MerchandiseTranDetailView {
    // TODO: implement view methods
}

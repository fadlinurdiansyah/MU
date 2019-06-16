//
//  SellMerchandiseViewController.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum SellMerchandise {
        // TODO: Add segue ids
    }
}

class SellMerchandiseViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: SellMerchandisePresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SellMerchandisePresenter.config(withSellMerchandiseViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SellMerchandiseViewController: SellMerchandiseView {
    // TODO: implement view methods
}

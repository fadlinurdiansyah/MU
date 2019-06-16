//
//  YourMenuFavoriteViewController.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum YourMenuFavorite {
        // TODO: Add segue ids
    }
}

class YourMenuFavoriteViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: YourMenuFavoritePresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        YourMenuFavoritePresenter.config(withYourMenuFavoriteViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension YourMenuFavoriteViewController: YourMenuFavoriteView {
    // TODO: implement view methods
}

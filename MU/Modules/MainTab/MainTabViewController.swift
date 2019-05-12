//
//  MainTabViewController.swift
//  MU
//
//  Created by fadielse on 12/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum MainTab {
        // TODO: Add segue ids
    }
}

class MainTabViewController: UITabBarController {
    
    // MARK: Properties
    
    var presenter: MainTabPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MainTabPresenter.config(withMainTabViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainTabViewController: MainTabView {
    // TODO: implement view methods
}

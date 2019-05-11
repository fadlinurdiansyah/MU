//
//  HomeViewController.swift
//  MU
//
//  Created by fadielse on 11/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum Home {
        // TODO: Add segue ids
    }
}

class HomeViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: HomePresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        HomePresenter.config(withHomeViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: HomeView {
    // TODO: implement view methods
}

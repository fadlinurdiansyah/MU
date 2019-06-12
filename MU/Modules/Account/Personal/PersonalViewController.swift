//
//  PersonalViewController.swift
//  MU
//
//  Created by NDS on 12/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

extension SegueConstants {
    enum Personal {
        // TODO: Add segue ids
    }
}

class PersonalViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: PersonalPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        PersonalPresenter.config(withPersonalViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PersonalViewController: PersonalView {
    // TODO: implement view methods
}

extension PersonalViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo.init(title: "Personal")
    }
    
}

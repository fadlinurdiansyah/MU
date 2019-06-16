//
//  YourMenuHistoryPresenter.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol YourMenuHistoryViewPresenter: class {
    init(view: YourMenuHistoryView)
    // TODO: Declare view presenter methods
}

protocol YourMenuHistoryView: class {
    // TODO: Declare view methods
}

class YourMenuHistoryPresenter: YourMenuHistoryViewPresenter {
    
    static func config(withYourMenuHistoryViewController viewController: YourMenuHistoryViewController) {
        let presenter = YourMenuHistoryPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: YourMenuHistoryView
    
    required init(view: YourMenuHistoryView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

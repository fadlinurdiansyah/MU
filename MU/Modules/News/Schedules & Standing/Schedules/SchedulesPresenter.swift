//
//  SchedulesPresenter.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol SchedulesViewPresenter: class {
    init(view: SchedulesView)
    // TODO: Declare view presenter methods
}

protocol SchedulesView: class {
    // TODO: Declare view methods
}

class SchedulesPresenter: SchedulesViewPresenter {
    
    static func config(withSchedulesViewController viewController: SchedulesViewController) {
        let presenter = SchedulesPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: SchedulesView
    
    required init(view: SchedulesView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

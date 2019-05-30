//
//  StandingsPresenter.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol StandingsViewPresenter: class {
    init(view: StandingsView)
    // TODO: Declare view presenter methods
}

protocol StandingsView: class {
    // TODO: Declare view methods
}

class StandingsPresenter: StandingsViewPresenter {
    
    static func config(withStandingsViewController viewController: StandingsViewController) {
        let presenter = StandingsPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: StandingsView
    
    required init(view: StandingsView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

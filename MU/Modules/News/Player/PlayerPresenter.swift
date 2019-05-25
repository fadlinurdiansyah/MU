//
//  PlayerPresenter.swift
//  MU
//
//  Created by NDS on 25/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol PlayerViewPresenter: class {
    init(view: PlayerView)
    // TODO: Declare view presenter methods
}

protocol PlayerView: class {
    // TODO: Declare view methods
}

class PlayerPresenter: PlayerViewPresenter {
    
    static func config(withPlayerViewController viewController: PlayerViewController) {
        let presenter = PlayerPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: PlayerView
    
    required init(view: PlayerView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

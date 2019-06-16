//
//  EventHistoryPresenter.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol EventHistoryViewPresenter: class {
    init(view: EventHistoryView)
    // TODO: Declare view presenter methods
}

protocol EventHistoryView: class {
    // TODO: Declare view methods
}

class EventHistoryPresenter: EventHistoryViewPresenter {
    
    static func config(withEventHistoryViewController viewController: EventHistoryViewController) {
        let presenter = EventHistoryPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: EventHistoryView
    
    required init(view: EventHistoryView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

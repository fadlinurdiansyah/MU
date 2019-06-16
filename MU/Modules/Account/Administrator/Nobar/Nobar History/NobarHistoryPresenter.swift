//
//  NobarHistoryPresenter.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol NobarHistoryViewPresenter: class {
    init(view: NobarHistoryView)
    // TODO: Declare view presenter methods
}

protocol NobarHistoryView: class {
    // TODO: Declare view methods
}

class NobarHistoryPresenter: NobarHistoryViewPresenter {
    
    static func config(withNobarHistoryViewController viewController: NobarHistoryViewController) {
        let presenter = NobarHistoryPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: NobarHistoryView
    
    required init(view: NobarHistoryView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

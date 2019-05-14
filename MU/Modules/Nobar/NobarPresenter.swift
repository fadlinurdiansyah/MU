//
//  NobarPresenter.swift
//  MU
//
//  Created by NDS on 15/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol NobarViewPresenter: class {
    init(view: NobarView)
    // TODO: Declare view presenter methods
}

protocol NobarView: class {
    // TODO: Declare view methods
}

class NobarPresenter: NobarViewPresenter {
    
    static func config(withNobarViewController viewController: NobarViewController) {
        let presenter = NobarPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: NobarView
    
    required init(view: NobarView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

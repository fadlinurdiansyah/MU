//
//  AddLocationNobarPresenter.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol AddLocationNobarViewPresenter: class {
    init(view: AddLocationNobarView)
    // TODO: Declare view presenter methods
}

protocol AddLocationNobarView: class {
    // TODO: Declare view methods
}

class AddLocationNobarPresenter: AddLocationNobarViewPresenter {
    
    static func config(withAddLocationNobarViewController viewController: AddLocationNobarViewController) {
        let presenter = AddLocationNobarPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: AddLocationNobarView
    
    required init(view: AddLocationNobarView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

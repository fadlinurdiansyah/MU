//
//  AddNobarPresenter.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol AddNobarViewPresenter: class {
    init(view: AddNobarView)
    // TODO: Declare view presenter methods
}

protocol AddNobarView: class {
    // TODO: Declare view methods
}

class AddNobarPresenter: AddNobarViewPresenter {
    
    static func config(withAddNobarViewController viewController: AddNobarViewController) {
        let presenter = AddNobarPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: AddNobarView
    
    required init(view: AddNobarView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

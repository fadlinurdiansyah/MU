//
//  OtherMenuPresenter.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol OtherMenuViewPresenter: class {
    init(view: OtherMenuView)
    // TODO: Declare view presenter methods
}

protocol OtherMenuView: class {
    // TODO: Declare view methods
}

class OtherMenuPresenter: OtherMenuViewPresenter {
    
    static func config(withOtherMenuViewController viewController: OtherMenuViewController) {
        let presenter = OtherMenuPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: OtherMenuView
    
    required init(view: OtherMenuView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

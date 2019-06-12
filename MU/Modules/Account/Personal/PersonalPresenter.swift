//
//  PersonalPresenter.swift
//  MU
//
//  Created by NDS on 12/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol PersonalViewPresenter: class {
    init(view: PersonalView)
    // TODO: Declare view presenter methods
}

protocol PersonalView: class {
    // TODO: Declare view methods
}

class PersonalPresenter: PersonalViewPresenter {
    
    static func config(withPersonalViewController viewController: PersonalViewController) {
        let presenter = PersonalPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: PersonalView
    
    required init(view: PersonalView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

//
//  AddEventPresenter.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol AddEventViewPresenter: class {
    init(view: AddEventView)
    // TODO: Declare view presenter methods
}

protocol AddEventView: class {
    // TODO: Declare view methods
}

class AddEventPresenter: AddEventViewPresenter {
    
    static func config(withAddEventViewController viewController: AddEventViewController) {
        let presenter = AddEventPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: AddEventView
    
    required init(view: AddEventView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

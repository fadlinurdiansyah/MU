//
//  AdminPresenter.swift
//  MU
//
//  Created by NDS on 12/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol AdminViewPresenter: class {
    init(view: AdminView)
    // TODO: Declare view presenter methods
}

protocol AdminView: class {
    // TODO: Declare view methods
}

class AdminPresenter: AdminViewPresenter {
    
    static func config(withAdminViewController viewController: AdminViewController) {
        let presenter = AdminPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: AdminView
    
    
    required init(view: AdminView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

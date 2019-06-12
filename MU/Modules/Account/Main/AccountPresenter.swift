//
//  AccountPresenter.swift
//  MU
//
//  Created by NDS on 12/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol AccountViewPresenter: class {
    init(view: AccountView)
    // TODO: Declare view presenter methods
}

protocol AccountView: class {
    // TODO: Declare view methods
}

class AccountPresenter: AccountViewPresenter {
    
    static func config(withAccountViewController viewController: AccountViewController) {
        let presenter = AccountPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: AccountView
    
    required init(view: AccountView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

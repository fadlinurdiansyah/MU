//
//  LoginPresenter.swift
//  MU
//
//  Created by NDS on 07/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol LoginViewPresenter: class {
    init(view: LoginView)
    // TODO: Declare view presenter methods
}

protocol LoginView: class {
    // TODO: Declare view methods
}

class LoginPresenter: LoginViewPresenter {
    
    static func config(withLoginViewController viewController: LoginViewController) {
        let presenter = LoginPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: LoginView
    
    required init(view: LoginView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

//
//  EditProfilePresenter.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol EditProfileViewPresenter: class {
    init(view: EditProfileView)
    // TODO: Declare view presenter methods
}

protocol EditProfileView: class {
    // TODO: Declare view methods
}

class EditProfilePresenter: EditProfileViewPresenter {
    
    static func config(withEditProfileViewController viewController: EditProfileViewController) {
        let presenter = EditProfilePresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: EditProfileView
    
    required init(view: EditProfileView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

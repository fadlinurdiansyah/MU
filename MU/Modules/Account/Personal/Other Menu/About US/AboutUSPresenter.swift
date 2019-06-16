//
//  AboutUSPresenter.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol AboutUSViewPresenter: class {
    init(view: AboutUSView)
    // TODO: Declare view presenter methods
}

protocol AboutUSView: class {
    // TODO: Declare view methods
}

class AboutUSPresenter: AboutUSViewPresenter {
    
    static func config(withAboutUSViewController viewController: AboutUSViewController) {
        let presenter = AboutUSPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: AboutUSView
    
    required init(view: AboutUSView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

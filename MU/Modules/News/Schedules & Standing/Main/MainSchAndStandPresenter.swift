//
//  MainSchAndStandPresenter.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol MainSchAndStandViewPresenter: class {
    init(view: MainSchAndStandView)
    // TODO: Declare view presenter methods
}

protocol MainSchAndStandView: class {
    // TODO: Declare view methods
}

class MainSchAndStandPresenter: MainSchAndStandViewPresenter {
    
    static func config(withMainSchAndStandViewController viewController: MainSchAndStandViewController) {
        let presenter = MainSchAndStandPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: MainSchAndStandView
    
    required init(view: MainSchAndStandView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

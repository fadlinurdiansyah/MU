//
//  MainTabPresenter.swift
//  MU
//
//  Created by fadielse on 12/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol MainTabViewPresenter: class {
    init(view: MainTabView)
    // TODO: Declare view presenter methods
}

protocol MainTabView: class {
    // TODO: Declare view methods
}

class MainTabPresenter: MainTabViewPresenter {
    
    static func config(withMainTabViewController viewController: MainTabViewController) {
        let presenter = MainTabPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: MainTabView
    
    required init(view: MainTabView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

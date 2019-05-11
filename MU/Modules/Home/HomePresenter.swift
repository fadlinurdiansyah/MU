//
//  HomePresenter.swift
//  MU
//
//  Created by fadielse on 11/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol HomeViewPresenter: class {
    init(view: HomeView)
    // TODO: Declare view presenter methods
}

protocol HomeView: class {
    // TODO: Declare view methods
}

class HomePresenter: HomeViewPresenter {
    
    static func config(withHomeViewController viewController: HomeViewController) {
        let presenter = HomePresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: HomeView
    
    required init(view: HomeView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

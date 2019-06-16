//
//  YourMenuFavoritePresenter.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol YourMenuFavoriteViewPresenter: class {
    init(view: YourMenuFavoriteView)
    // TODO: Declare view presenter methods
}

protocol YourMenuFavoriteView: class {
    // TODO: Declare view methods
}

class YourMenuFavoritePresenter: YourMenuFavoriteViewPresenter {
    
    static func config(withYourMenuFavoriteViewController viewController: YourMenuFavoriteViewController) {
        let presenter = YourMenuFavoritePresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: YourMenuFavoriteView
    
    required init(view: YourMenuFavoriteView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

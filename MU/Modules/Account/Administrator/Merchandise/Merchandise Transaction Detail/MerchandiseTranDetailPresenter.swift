//
//  MerchandiseTranDetailPresenter.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol MerchandiseTranDetailViewPresenter: class {
    init(view: MerchandiseTranDetailView)
    // TODO: Declare view presenter methods
}

protocol MerchandiseTranDetailView: class {
    // TODO: Declare view methods
}

class MerchandiseTranDetailPresenter: MerchandiseTranDetailViewPresenter {
    
    static func config(withMerchandiseTranDetailViewController viewController: MerchandiseTranDetailViewController) {
        let presenter = MerchandiseTranDetailPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: MerchandiseTranDetailView
    
    required init(view: MerchandiseTranDetailView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

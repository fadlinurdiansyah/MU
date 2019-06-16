//
//  SellMerchandisePresenter.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol SellMerchandiseViewPresenter: class {
    init(view: SellMerchandiseView)
    // TODO: Declare view presenter methods
}

protocol SellMerchandiseView: class {
    // TODO: Declare view methods
}

class SellMerchandisePresenter: SellMerchandiseViewPresenter {
    
    static func config(withSellMerchandiseViewController viewController: SellMerchandiseViewController) {
        let presenter = SellMerchandisePresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: SellMerchandiseView
    
    required init(view: SellMerchandiseView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

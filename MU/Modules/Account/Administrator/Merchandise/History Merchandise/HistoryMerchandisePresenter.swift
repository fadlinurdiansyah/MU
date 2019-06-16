//
//  HistoryMerchandisePresenter.swift
//  MU
//
//  Created by NDS on 14/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol HistoryMerchandiseViewPresenter: class {
    init(view: HistoryMerchandiseView)
    // TODO: Declare view presenter methods
}

protocol HistoryMerchandiseView: class {
    // TODO: Declare view methods
}

class HistoryMerchandisePresenter: HistoryMerchandiseViewPresenter {
    
    static func config(withHistoryMerchandiseViewController viewController: HistoryMerchandiseViewController) {
        let presenter = HistoryMerchandisePresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: HistoryMerchandiseView
    
    required init(view: HistoryMerchandiseView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

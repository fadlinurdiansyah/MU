//
//  YourMenuTransactionPresenter.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol YourMenuTransactionViewPresenter: class {
    init(view: YourMenuTransactionView)
    // TODO: Declare view presenter methods
}

protocol YourMenuTransactionView: class {
    // TODO: Declare view methods
}

class YourMenuTransactionPresenter: YourMenuTransactionViewPresenter {
    
    static func config(withYourMenuTransactionViewController viewController: YourMenuTransactionViewController) {
        let presenter = YourMenuTransactionPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: YourMenuTransactionView
    
    required init(view: YourMenuTransactionView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

//
//  NewsPresenter.swift
//  MU
//
//  Created by fadielse on 12/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol NewsViewPresenter: class {
    init(view: NewsView)
    // TODO: Declare view presenter methods
}

protocol NewsView: class {
    // TODO: Declare view methods
}

class NewsPresenter: NewsViewPresenter {
    
    static func config(withNewsViewController viewController: NewsViewController) {
        let presenter = NewsPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: NewsView
    
    required init(view: NewsView) {
        self.view = view
    }
    
    // TODO: Implement view presenter methods
}

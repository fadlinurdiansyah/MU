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
    func getLinkShareOnNews() -> String?
    func getTextShareOnNews() -> String?
}

protocol NewsView: class {
    // TODO: Declare view methods
}

class NewsPresenter: NewsViewPresenter {
    
    func getLinkShareOnNews() -> String? {
        let link = "https://www.muid.site"
        
        return link
    }
    
    func getTextShareOnNews() -> String? {
        let shareText = "Dapatkan informasi terupdate tentang Manchester United"
        
        return shareText
    }
    
    
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

//
//  NewsDetailPresenter.swift
//  MU
//
//  Created by NDS on 18/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol NewsDetailViewPresenter: class {
    init(view: NewsDetailView)
    
    func getLinkShare() -> String
    func getTextShare() -> String
    func getNewsData() -> NewsData?
    func getHeroId() -> Int
}

protocol NewsDetailView: class {
    // TODO: Declare view methods
}

class NewsDetailPresenter: NewsDetailViewPresenter {
   
    static func config(withNewsDetailViewController viewController: NewsDetailViewController) {
        let presenter = NewsDetailPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: NewsDetailView
    var data: NewsData?
    var heroId: Int = 0
    
    required init(view: NewsDetailView) {
        self.view = view
    }
    
    func getLinkShare() -> String {
        let link = "https://www.muid.site"
        
        return link
    }
    
    func getTextShare() -> String {
        let shareText = "Dapatkan informasi terupdate tentang Manchester United"
        
        return shareText
    }
    
    func getNewsData() -> NewsData? {
        return data
    }
    
    func getHeroId() -> Int {
        return heroId
    }
}

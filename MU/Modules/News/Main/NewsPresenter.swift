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
    func getListNews()
    func loadFirstPage()
    func loadNextPage()
    func reloadFirstPage()
    func getLinkShareOnNews() -> String
    func getTextShareOnNews() -> String
    func getNewsItem() -> [NewsData]
}

protocol NewsView: class {
    func showLoading()
    func hideLoading()
    func getListNewsSuccess()
    func getListNewsFailed(withErrorException error: ErrorExceptionAPI)
}

class NewsPresenter: NewsViewPresenter {
    
    static func config(withNewsViewController viewController: NewsViewController) {
        let presenter = NewsPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: NewsView
    var pageStart: Int = 0 // default page start for first request
    var pageSize: Int = 5
    var hasNext: Bool = true // flag check has nxt page
    var isShowLoading = false // flag misalkan di view ada loading yg blok halaman pas request
    var listNewsItems: [NewsData] = []
    
    required init(view: NewsView) {
        self.view = view
    }
    
    func getLinkShareOnNews() -> String {
        let link = "https://www.muid.site"
        
        return link
    }
    
    func getTextShareOnNews() -> String {
        let shareText = "Dapatkan informasi terupdate tentang Manchester United"
        
        return shareText
    }
    
    func resetListNews() {
        listNewsItems.removeAll()
    }
    
    func loadFirstPage() { // load awal saat buka halaman (pake loading block)
        isShowLoading = true
        getListNews()
    }
    
    func loadNextPage() { // load dari infinite scroll table
        isShowLoading = false
        
        if hasNext {
            pageStart += 5
            getListNews()
        }
    }
    
    func reloadFirstPage() { // load dari pull to refresh table (ga pake loading block)
        resetListNews()
        isShowLoading = false
        getListNews()
    }
    
    func getListNews() {
        let newsRequest = NewsRequest()
        newsRequest.offset = pageStart
        newsRequest.limit = pageSize
        
        MUAPI.instance.request(ApiNews.getListNews(request: newsRequest), success: { (json) in
            self.view.hideLoading()
            let listNewsDAO = ListNewsDAO(json: json)
            
            if let listNews = listNewsDAO.listNews {
                self.listNewsItems.append(contentsOf: listNews.data)
                self.hasNext = listNews.hasNext()
                 self.view.getListNewsSuccess()
            } else {
                self.view.getListNewsFailed(withErrorException: InternalServerErrorException())
            }
        }) { (error) in
            self.view.hideLoading()
            self.view.getListNewsFailed(withErrorException: error)
        }
    }
    
    func getNewsItem() -> [NewsData] {
        return listNewsItems
    }
}

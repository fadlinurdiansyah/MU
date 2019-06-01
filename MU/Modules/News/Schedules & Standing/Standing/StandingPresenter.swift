//
//  StandingPresenter.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol StandingViewPresenter: class {
    init(view: StandingView)
    func getListStandingItem() -> [Table]
    func countListStandingItem() -> Int
}

protocol StandingView: class {
    func getListStandingSuccess()
    func getListStandingFailed(withErrorException error: ErrorExceptionAPI)
    func showLoading()
    func hideLoading()
}

class StandingPresenter: StandingViewPresenter {
   
    static func config(withStandingViewController viewController: StandingViewController) {
        let presenter = StandingPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: StandingView
    let idLeague = "4328"
    let seasonLeague = "1819"
    var listStandingItems: [Table] = []
    var isShowLoading = false
    
    required init(view: StandingView) {
        self.view = view
    }
    
    func loadPage() {
        isShowLoading = true
        getListStanding()
    }
    
    func getListStanding() {
        
        if isShowLoading {
            view.showLoading()
        }
        
        let standingRequest = StandingRequest()
        standingRequest.idLeague = idLeague
        standingRequest.seasonLeague = seasonLeague
        
        MUAPI.instance.request(ApiStanding.getListStanding(request: standingRequest), success: { (json) in
            
            let listStandingDAO = ListStandingDAO(json: json)
            
            if let listStanding = listStandingDAO.listStandings {
            
                self.listStandingItems.append(contentsOf: listStanding.table)
                self.view.hideLoading()
                self.view.getListStandingSuccess()
                
            } else {
                self.view.getListStandingFailed(withErrorException: InternalServerErrorException())
            }
            
        }, exception: { (error) in
            
            self.view.getListStandingFailed(withErrorException: error)
        }
        
        )
    }

    func getListStandingItem() -> [Table] {
        return listStandingItems
    }
    
    func countListStandingItem() -> Int {
        return listStandingItems.count
    }
}

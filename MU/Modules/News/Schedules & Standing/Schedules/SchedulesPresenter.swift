//
//  SchedulesPresenter.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol SchedulesViewPresenter: class {
    init(view: SchedulesView)
    func getListSchedulesItem() -> [Events]
}

protocol SchedulesView: class {
    func getListSchedulesSuccess()
    func getListSchedulesFailed(withErrorException error: ErrorExceptionAPI)
    func showLoading()
    func hideLoading()
}

class SchedulesPresenter: SchedulesViewPresenter {
    
    static func config(withSchedulesViewController viewController: SchedulesViewController) {
        let presenter = SchedulesPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: SchedulesView
    let idLeague = "4328"
    let seasonLeague = "1819"
    var listSchedulesItem: [Events] = []
    var isShowLoading = false
    
    required init(view: SchedulesView) {
        self.view = view
    }
    
    func loadPage() {
        isShowLoading = true
        getListSchedules()
    }
    
    func getListSchedules() {
        
        if isShowLoading {
            view.showLoading()
        }
        
        let schedulesRequest = SchedulesRequest()
        schedulesRequest.idLeague = idLeague
        schedulesRequest.seasonLeague = seasonLeague
        
        MUAPI.instance.request(ApiSchedules.getListSchedules(request: schedulesRequest), success: { (json) in
            
            let listSchedulesDAO = ListSchedulesDAO(json: json)
            
            if let listSchedules = listSchedulesDAO.listSchedules {
                
                self.listSchedulesItem.append(contentsOf: listSchedules.events)
                self.view.hideLoading()
                self.view.getListSchedulesSuccess()
            } else {
                
                self.view.getListSchedulesFailed(withErrorException: InternalServerErrorException())
            }
            
        }, exception: { (error) in
            self.view.getListSchedulesFailed(withErrorException: error)
        }
        
        )
        
    }
    
    func getListSchedulesItem() -> [Events] {
        return listSchedulesItem
    }

}

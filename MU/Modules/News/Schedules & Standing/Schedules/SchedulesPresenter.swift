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
    func getListSchedules()
    func getListNextSchedules()
    func getListLastSchedules()
    func filterSchedulesItem()
    func getListSchedulesItem() -> [Events]
    func getListScheduleseItemFilter() -> [Events]
    func getCountSchedulesItem() -> Int
    func getCountSchedulesItemFilter() -> Int
    func loadPage()
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
    let teamFilter = "Man United"
    let teamId = "133612"
    var listSchedulesItem: [Events] = []
    var listScheduleItemFilter: [Events] = []
    var listSchedulesNextItem: [Events] = []
    var listSchedulesLastItem: [Results] = []
    var isShowLoading = false
    
    required init(view: SchedulesView) {
        self.view = view
    }
    
    func loadPage() {
        isShowLoading = true
//        getListSchedules()
        getListNextSchedules()
//        getListLastSchedules()
       
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
                self.filterSchedulesItem()
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
    
    func filterSchedulesItem() {
        listScheduleItemFilter = listSchedulesItem.filter {$0.strEvent!.localizedStandardContains(teamFilter)}
    }
    
    func getListNextSchedules() {
        
        if isShowLoading {
            self.view.showLoading()
        }
        
        let nextSchedulesRequest = NextSchedulesRequest()
        nextSchedulesRequest.teamId = teamId
        
        MUAPI.instance.request(ApiSchedules.getNextSchedules(request: nextSchedulesRequest), success: { (json) in
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
    
    func getListLastSchedules() {
        
        if isShowLoading {
            self.view.showLoading()
        }
        
        let lastSchedulesRequest = LastSchedulesRequest()
        lastSchedulesRequest.teamId = teamId
        
        MUAPI.instance.request(ApiSchedules.getLastSchedules(request: lastSchedulesRequest), success: { (json) in
            
            let listLastSchedulesDAO = ListLastSchedulesDAO(json: json)
            if let listSchedules = listLastSchedulesDAO.listLastSchedules {
                self.listSchedulesLastItem.append(contentsOf: listSchedules.events)
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
    
    func getCountSchedulesItem() -> Int {
        return listSchedulesItem.count
    }
    
    func getCountSchedulesItemFilter() -> Int {
        return listScheduleItemFilter.count
    }
    
    func getListScheduleseItemFilter() -> [Events] {
        return listScheduleItemFilter
    }
    
}

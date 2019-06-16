//
//  AdminPresenter.swift
//  MU
//
//  Created by NDS on 12/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol AdminViewPresenter: class {
    init(view: AdminView)
    
    func getListTitleHeader() -> [String]
    func getListTitleNobar() -> [String]
    func getListTitleEvent() -> [String]
    func getListTitleMerchandise() -> [String]
    func getCountHeaderCell() -> Int
    func getCountNobarCell() -> Int
    func getCountEventCell() -> Int
    func getCountMerchandiseCell() -> Int
}

protocol AdminView: class {
    // TODO: Declare view methods
}

class AdminPresenter: AdminViewPresenter {
    
    static func config(withAdminViewController viewController: AdminViewController) {
        let presenter = AdminPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: AdminView
    let listTitleHeader = ["", "Nonton Bareng", "Event", "Merchandise"]
    let listTitleNobar = ["Tambah Nonton Bareng", "Tambah Lokasi", "History"]
    let listTitleEvent = ["Tambah Event", "History"]
    let listTitleMerchandise = ["Jual Merchandise", "Detail Transaksi", "History"]
    
    required init(view: AdminView) {
        self.view = view
    }
    
    func getListTitleHeader() -> [String] {
        return listTitleHeader
    }
    
    func getListTitleNobar() -> [String] {
        return listTitleNobar
    }
    
    func getListTitleEvent() -> [String] {
        return listTitleEvent
    }
    
    func getListTitleMerchandise() -> [String] {
        return listTitleMerchandise
    }
    
    func getCountHeaderCell() -> Int {
        return listTitleHeader.count
    }
    
    func getCountNobarCell() -> Int {
        return listTitleNobar.count
    }
    
    func getCountEventCell() -> Int {
        return listTitleEvent.count
    }
    
    func getCountMerchandiseCell() -> Int {
        return listTitleMerchandise.count
    }
}

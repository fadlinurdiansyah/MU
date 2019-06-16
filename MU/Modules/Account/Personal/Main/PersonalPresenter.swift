//
//  PersonalPresenter.swift
//  MU
//
//  Created by NDS on 12/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol PersonalViewPresenter: class {
    init(view: PersonalView)
    func getListTitleHeader() -> [String]
    func getListTitleYourMenu() -> [String]
    func getListTitelOtherMenu() -> [String]
    func getCountHeaderCell() -> Int
    func getCountYourMenuCell() -> Int
    func getCountOtherMenuCell() -> Int
}

protocol PersonalView: class {
    // TODO: Declare view methods
}

class PersonalPresenter: PersonalViewPresenter {
    
    
    static func config(withPersonalViewController viewController: PersonalViewController) {
        let presenter = PersonalPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: PersonalView
    let listTitleHeader = ["Menu Kamu", "Lainnya"]
    let listTitleYourMenu = ["History", "Favorite", "Transaksi"]
    let listTitleOtherMenu = ["Tentang Kami", "Keluar"]
    
    required init(view: PersonalView) {
        self.view = view
    }
    
    func getListTitleHeader() -> [String] {
        return listTitleHeader
    }
    
    func getListTitleYourMenu() -> [String] {
        return listTitleYourMenu
    }
    
    func getListTitelOtherMenu() -> [String] {
        return listTitleOtherMenu
    }
    
    func getCountHeaderCell() -> Int {
        return listTitleHeader.count
    }
    
    func getCountYourMenuCell() -> Int {
        return listTitleYourMenu.count
    }
    
    func getCountOtherMenuCell() -> Int {
        return listTitleOtherMenu.count
    }
    
    // TODO: Implement view presenter methods
}

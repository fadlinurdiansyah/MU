//
//  AdminViewController.swift
//  MU
//
//  Created by NDS on 12/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

extension SegueConstants {
    enum Admin {
        static let showAddNobar = "showAddNobar"
        static let showAddLocationNobar = "showAddLocationNobar"
        static let showNobarHistory = "showNobarHistory"
        static let showAddEvent = "showAddEvent"
        static let showEventHistory = "showEventHistory"
        static let showSellMerchandise = "showSellMerchandise"
        static let showMerchandiseTranDetail = "showMerchandiseTranDetail"
        static let showMerchandiseHistory = "showMerchandiseHistory"
    }
}

class AdminViewController: BaseViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var tableViewAdmin: UITableView!
    
    var presenter: AdminPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AdminPresenter.config(withAdminViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        tableViewAdmin.register(AccountLevelCell.nib, forCellReuseIdentifier: AccountLevelCell.identifier)
        tableViewAdmin.register(AdminCellDetail.nib, forCellReuseIdentifier: AdminCellDetail.identifier)
        tableViewAdmin.register(AdminCellHeader.nib, forCellReuseIdentifier: AdminCellHeader.identifier)
        
        tableViewAdmin.contentInset = UIEdgeInsets(top: 13, left: 0, bottom: 0, right: 0)
        tableViewAdmin.scrollIndicatorInsets = UIEdgeInsets(top: 13, left: 0, bottom: 0, right: 0)
        
    }
}

extension AdminViewController: AdminView {
    // TODO: implement view methods
}

// Set this vc as child from main vc with library XLPagerTabStrip
extension AdminViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "Administrator")
    }
    
}

extension AdminViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let num = presenter.getCountHeaderCell()
        return num
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numRow: Int
        
        switch AccountSection(rawValue: section) {
        case .userLevel?:
            return 1
        case .nobar?:
            numRow = presenter.getCountNobarCell()
            return numRow
        case .event?:
            numRow = presenter.getCountEventCell()
            return numRow
        case .merchandise?:
            numRow = presenter.getCountMerchandiseCell()
            return numRow
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var listTitle: [String] = []
        guard let cellAdminDetail = tableViewAdmin.dequeueReusableCell(withIdentifier: AdminCellDetail.identifier, for: indexPath) as? AdminCellDetail else {
            return UITableViewCell()
        }
        
        switch AccountSection(rawValue: indexPath.section) {
        case .userLevel?:
            if let userLevelCell = tableViewAdmin.dequeueReusableCell(withIdentifier: AccountLevelCell.identifier, for: indexPath) as? AccountLevelCell {
                return userLevelCell
            }
            
        case .nobar?:
            listTitle = presenter.getListTitleNobar()
            cellAdminDetail.title = listTitle[indexPath.row]
            cellAdminDetail.updateUI()
            return cellAdminDetail
            
        case .event?:
            listTitle = presenter.getListTitleEvent()
            cellAdminDetail.title = listTitle[indexPath.row]
            cellAdminDetail.updateUI()
            return cellAdminDetail
            
        case .merchandise?:
            listTitle = presenter.getListTitleMerchandise()
            cellAdminDetail.title = listTitle[indexPath.row]
            cellAdminDetail.updateUI()
            return cellAdminDetail
            
        case .none:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let cellHeader = tableViewAdmin.dequeueReusableCell(withIdentifier: AdminCellHeader.identifier) as? AdminCellHeader {

            let listTitle = presenter.getListTitleHeader()

            switch AccountSection(rawValue: section) {
            case .userLevel?:
                return nil
                
            case .nobar?:
                cellHeader.title = listTitle[section]
                cellHeader.updateUI()
                return cellHeader
                
            case .event?:
                cellHeader.title = listTitle[section]
                cellHeader.updateUI()
                return cellHeader
                
            case .merchandise?:
                cellHeader.title = listTitle[section]
                cellHeader.updateUI()
                return cellHeader
                
            case .none:
                return nil
            }

        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch AccountSection(rawValue: section) {
        case .userLevel?:
            return 0.0000001
            
        case .nobar?:
            return 52
            
        case .event?:
            return 52
            
        case .merchandise?:
            return 52
            
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch AccountSection(rawValue: section) {
            
        case .userLevel?:
            return 13.3
            
        case .nobar?:
            return 13.3
            
        case .event?:
            return 13.3
            
        case .merchandise?:
            return 0.0000001
            
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Show detail view
        switch AccountSection(rawValue: indexPath.section) {
            
        case .userLevel?:
            break
            
        case .nobar?:
            
            switch NobarRow(rawValue: indexPath.row) {
            case .addNobar?:
                performSegue(withIdentifier: SegueConstants.Admin.showAddNobar, sender: nil)
                
            case .addLocNobar?:
                performSegue(withIdentifier: SegueConstants.Admin.showAddLocationNobar, sender: nil)
                
            case .nobarHistory?:
                performSegue(withIdentifier: SegueConstants.Admin.showNobarHistory, sender: nil)
                
            case .none:
                break
            }
    
        case .event?:
            
            switch EventRow(rawValue: indexPath.row) {
            case .addEvent?:
                performSegue(withIdentifier: SegueConstants.Admin.showAddEvent, sender: nil)
                
            case .eventHistory?:
                performSegue(withIdentifier: SegueConstants.Admin.showEventHistory, sender: nil)
                
            case .none:
                break
            }
            
        case .merchandise?:
            
            switch MerchandiseRow(rawValue: indexPath.row) {
            case .sellMerchandise?:
                performSegue(withIdentifier: SegueConstants.Admin.showSellMerchandise, sender: nil)
                
            case .merchandiseTranDetail?:
                performSegue(withIdentifier: SegueConstants.Admin.showMerchandiseTranDetail, sender: nil)
                
            case .merchandiseHistory?:
                performSegue(withIdentifier: SegueConstants.Admin.showMerchandiseHistory, sender: nil)
                
            case .none:
                break
            }
            
        case .none:
            break
        }
    }
    
}

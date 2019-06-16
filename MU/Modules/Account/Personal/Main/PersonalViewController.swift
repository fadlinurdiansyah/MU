//
//  PersonalViewController.swift
//  MU
//
//  Created by NDS on 12/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

extension SegueConstants {
    enum Personal {
        static let showYourMenuHistory = "showYourMenuHistory"
        static let showYourMenuFavorite = "showYourMenuFavorite"
        static let showYourMenuTransaction = "showYourMenuTransaction"
        static let showAboutUS = "showAboutUS"
    }
}

class PersonalViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var tableViewPersonal: UITableView!
    
    var presenter: PersonalPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        PersonalPresenter.config(withPersonalViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // Configure table view
    func setupTableView() {
        tableViewPersonal.register(PersonalCellHeader.nib, forCellReuseIdentifier: PersonalCellHeader.identifier)
        tableViewPersonal.register(PersonalCellDetail.nib, forCellReuseIdentifier: PersonalCellDetail.identifier)
        tableViewPersonal.contentInset = UIEdgeInsets(top: 13.3, left: 0, bottom: 0, right: 0)
        tableViewPersonal.scrollIndicatorInsets = UIEdgeInsets(top: 13.3, left: 0, bottom: 0, right: 0)
    }
}

extension PersonalViewController: PersonalView {
    // TODO: implement view methods
}

// Set this vc as child from main vc with library XLPagerTabStrip
extension PersonalViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo.init(title: "Personal")
    }
    
}

extension PersonalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let numSection = presenter.getCountHeaderCell()
        return numSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numRow: Int
        
        switch PersonalSection(rawValue: section) {
            
        case .yourMenu?:
            numRow = presenter.getCountYourMenuCell()
            return numRow
        case .otherMenu?:
            numRow = presenter.getCountOtherMenuCell()
            return numRow
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var listTitle: [String] = []
        
        guard let cellPersonalDetail = tableViewPersonal.dequeueReusableCell(withIdentifier: PersonalCellDetail.identifier, for: indexPath) as? PersonalCellDetail else {
            return UITableViewCell()
        }
        
        switch PersonalSection(rawValue: indexPath.section) {
            
        case .yourMenu?:
            listTitle = presenter.getListTitleYourMenu()
            cellPersonalDetail.title = listTitle[indexPath.row]
            cellPersonalDetail.updateUI()
            return cellPersonalDetail
            
        case .otherMenu?:
            listTitle = presenter.getListTitelOtherMenu()
            cellPersonalDetail.title = listTitle[indexPath.row]
            cellPersonalDetail.updateUI()
            return cellPersonalDetail
            
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let cellPersonalHeader = tableViewPersonal.dequeueReusableCell(withIdentifier: PersonalCellHeader.identifier) as? PersonalCellHeader {
            
            let listTitleHeader = presenter.getListTitleHeader()
            
            switch PersonalSection(rawValue: section) {
            case .yourMenu?:
                cellPersonalHeader.title = listTitleHeader[section]
                cellPersonalHeader.updateUI()
                return cellPersonalHeader
            case .otherMenu?:
                cellPersonalHeader.title = listTitleHeader[section]
                cellPersonalHeader.updateUI()
                return cellPersonalHeader
            case .none:
                return nil
            }
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch PersonalSection(rawValue: section) {
        case .yourMenu?:
            return 52
        case .otherMenu?:
            return 52
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        switch PersonalSection(rawValue: section) {
        case .yourMenu?:
            return 13.3
        case .otherMenu?:
            return 0
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch PersonalSection(rawValue: indexPath.section) {
        case .yourMenu?:
            
            switch YourMenuRow(rawValue: indexPath.row) {
            case .history?:
                performSegue(withIdentifier: SegueConstants.Personal.showYourMenuHistory, sender: nil)
                
            case .favorite?:
                performSegue(withIdentifier: SegueConstants.Personal.showYourMenuFavorite, sender: nil)
                
            case .transaction?:
                performSegue(withIdentifier: SegueConstants.Personal.showYourMenuTransaction, sender: nil)
                
            case .none:
                break
            }

        case .otherMenu?:
            switch OtherMenuRow(rawValue: indexPath.row) {
            case .aboutUS?:
                performSegue(withIdentifier: SegueConstants.Personal.showAboutUS, sender: nil)
            
            case .logout?:
                break
                
            case .none:
                break
            }
            
        case .none:
            break
        }
    }
}

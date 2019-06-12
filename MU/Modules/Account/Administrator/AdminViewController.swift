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
        // TODO: Add segue ids
    }
}

class AdminViewController: BaseViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var adminTableView: UITableView!
    
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
        adminTableView.register(LevelAccountCell.nib, forCellReuseIdentifier: LevelAccountCell.identifier)
        adminTableView.register(NobarSetupCell.nib, forCellReuseIdentifier: NobarSetupCell.identifier)
    }
}

extension AdminViewController: AdminView {
    // TODO: implement view methods
}

extension AdminViewController: IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "Administrator")
    }
    
}

extension AdminViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch AccountSection(rawValue: section) {
        case .userLevel?:
            return 1
        case .nobar?:
            return 3
        case .event?:
            return 2
        case .merchandise?:
            return 3
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch AccountSection(rawValue: indexPath.section) {
        case .userLevel?:
            if let userLevelCell = adminTableView.dequeueReusableCell(withIdentifier: LevelAccountCell.identifier, for: indexPath) as? LevelAccountCell {
                return userLevelCell
            }
        case .nobar?:
            if let nobarSetupCell = adminTableView.dequeueReusableCell(withIdentifier: NobarSetupCell.identifier, for: indexPath) as? NobarSetupCell {
                return nobarSetupCell
            }
        case .event?:
            return UITableViewCell()
        case .merchandise?:
            return UITableViewCell()
        case .none:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch AccountSection(rawValue: section) {
        case .userLevel?:
            return nil
        case .nobar?:
            return "Nonton Bareng"
        case .event?:
            return "Event"
        case .merchandise?:
            return "Merchandise"
        case .none:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch AccountSection(rawValue: section) {
        case .userLevel?:
            return 1
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
    
}

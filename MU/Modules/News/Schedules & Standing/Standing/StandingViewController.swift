//
//  StandingViewController.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum Standing {
        // TODO: Add segue ids
    }
}

class StandingViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var standingTableView: UITableView!
    
    var standingData: [Table] = []
    
    var presenter: StandingPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        StandingPresenter.config(withStandingViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        presenter.loadPage()
    }
    
    func setupTableView() {
        standingTableView.register(HeaderStandingCell.nib, forCellReuseIdentifier: HeaderStandingCell.identifier)
        standingTableView.register(StandingCell.nib, forCellReuseIdentifier: StandingCell.identifier)
    }
    
}

extension StandingViewController: StandingView {
    
    func getListStandingFailed(withErrorException error: ErrorExceptionAPI) {
        if error.isTypeErrorConvertingJson() {
            self.showShowServerError(withView: self.view)
        } else if error.isTypeInternalServerError() {
            self.showShowServerError(withView: self.view)
        } else if error.isTypeNoInternetConnection() {
            self.showErrorConnection(withView: self.view)
        }
    }
    
    func showLoading() {
        self.showBlockLoading(withView: self.view)
    }
    
    func hideLoading() {
        self.stopBlockLoading()
    }
    
    func getListStandingSuccess() {
        standingData = presenter.getListStandingItem()
        standingTableView.reloadData()
    }
}

extension StandingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standingData.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cellHeader = standingTableView.dequeueReusableCell(withIdentifier: HeaderStandingCell.identifier) as? HeaderStandingCell else { fatalError() }
            return cellHeader
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellStanding = standingTableView.dequeueReusableCell(withIdentifier: StandingCell.identifier, for: indexPath) as? StandingCell {
            if self.standingData.indices.contains(indexPath.row) {
                let data = standingData[indexPath.row]
                cellStanding.standingData = data
                cellStanding.position = indexPath.row
                cellStanding.updateUI()
            }
            return cellStanding
        } else {
            return UITableViewCell()
        }
    }
}

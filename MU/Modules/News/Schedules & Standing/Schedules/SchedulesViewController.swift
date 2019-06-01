//
//  SchedulesViewController.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum Schedules {
        // TODO: Add segue ids
    }
}

class SchedulesViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var schedulesTableView: UITableView!
    
    var presenter: SchedulesPresenter!
    var schedulesData: [Events] = []
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SchedulesPresenter.config(withSchedulesViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScheduleTabelView()
        presenter.loadPage()
    }
    
    func setupScheduleTabelView() {
        schedulesTableView.register(SchedulesCell.nib, forCellReuseIdentifier: SchedulesCell.identifier)
    }
    
}

extension SchedulesViewController: SchedulesView {
    
    func getListSchedulesSuccess() {
        schedulesData = presenter.getListSchedulesItem()
        schedulesTableView.reloadData()
    }
    
    func getListSchedulesFailed(withErrorException error: ErrorExceptionAPI) {
        if error.isTypeErrorConvertingJson() {
            self.showShowServerError(withView: self.view)
        } else if error.isTypeErrorConvertingJson() {
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
    
}

extension SchedulesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedulesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellSchedules = schedulesTableView.dequeueReusableCell(withIdentifier: SchedulesCell.identifier, for: indexPath) as? SchedulesCell {
            
            if schedulesData.indices.contains(indexPath.row) {
                let data = schedulesData[indexPath.row]
                cellSchedules.dataSchedules = data
                cellSchedules.updateUI()
            }
            
            return cellSchedules
            
        } else {
            return UITableViewCell()
        }
    }
    
}

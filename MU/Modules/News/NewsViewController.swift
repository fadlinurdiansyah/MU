//
//  NewsViewController.swift
//  MU
//
//  Created by fadielse on 12/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum News {
        // TODO: Add segue ids
    }
}

class NewsViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var beritaTableView: UITableView!
    
    var presenter: NewsPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NewsPresenter.config(withNewsViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beritaTableView.estimatedRowHeight = 350
        beritaTableView.rowHeight = UITableView.automaticDimension
        beritaTableView.register(MatchCell.nib, forCellReuseIdentifier: MatchCell.identifier)
    }
}

extension NewsViewController: NewsView {
    // TODO: implement view methods
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let matchCell = beritaTableView.dequeueReusableCell(withIdentifier: MatchCell.identifier, for: indexPath) as? MatchCell {
            return matchCell
        }
        
        return UITableViewCell()
    }
}

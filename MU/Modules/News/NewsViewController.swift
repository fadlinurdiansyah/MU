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
        static let showDetailBerita = "showDetailBerita"
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
//        beritaTableView.estimatedRowHeight = 350
//        beritaTableView.rowHeight = UITableView.automaticDimension
        beritaTableView.register(MatchCell.nib, forCellReuseIdentifier: MatchCell.identifier)
        beritaTableView.register(BeritaCell.nib, forCellReuseIdentifier: BeritaCell.identifier)
        
        loadPage()
    }
    
    func loadPage() {
        self.presenter.loadFirstPage()
    }
}

extension NewsViewController: NewsView {
    func showLoading() {
        // TODO: Show Block Loading Here
    }
    
    func hideLoading() {
        // TODO: Hide Block Loading Here
    }
    
    func getListNewsSuccess(withListNews listNews: ListNews) {
        // TODO : Action for success
    }
    
    func getListNewsFailed(withErrorException error: ErrorExceptionAPI) {
        // TODO : Action for failure
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch NewsSection(rawValue: section) {
        case .match?:
            return 1
        case .news?:
            return 2
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch NewsSection(rawValue: indexPath.section) {
        case .match?:
            if let matchCell = beritaTableView.dequeueReusableCell(withIdentifier: MatchCell.identifier, for: indexPath) as? MatchCell {
                return matchCell
            }
        case .news?:
            if let newsCell = beritaTableView.dequeueReusableCell(withIdentifier: BeritaCell.identifier, for: indexPath) as? BeritaCell {
                return newsCell
            }
        case .none:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let newsCell = beritaTableView.cellForRow(at: indexPath) as? BeritaCell
        let numOindexInSection = (indexPath.section)
        if numOindexInSection == 1 {
            performSegue(withIdentifier: SegueConstants.News.showDetailBerita, sender: self)
        }
    }
    
}

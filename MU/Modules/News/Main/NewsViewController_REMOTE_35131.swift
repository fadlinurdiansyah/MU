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
        static let showNewsDetail = "showNewsDetail"
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
                newsCell.delegate = self
                return newsCell
            }
        case .none:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch NewsSection(rawValue: indexPath.section) {
        case .news?:
            performSegue(withIdentifier: SegueConstants.News.showNewsDetail, sender: self)
        default:
            break
        }
    }
    
}

extension NewsViewController: BeritaCellDelegate {
    func didTapButtonShare() {
        
        let shareLink = presenter.getTextShareOnNews()
        let shareText = presenter.getTextShareOnNews()
        
        let activityVC = UIActivityViewController(activityItems: ["\(String(describing: shareText))", "\(String(describing: shareLink))"], applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }

}

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
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIApplication.shared.statusBarView?.backgroundColor = ColorConstants.primaryRed
        navigationController?.navigationBar.setColors(backgroundWithColor: ColorConstants.primaryRed, textWithColor: UIColor.white)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        beritaTableView.estimatedRowHeight = 350
//        beritaTableView.rowHeight = UITableView.automaticDimension
        beritaTableView.register(MatchCell.nib, forCellReuseIdentifier: MatchCell.identifier)
        beritaTableView.register(BeritaCell.nib, forCellReuseIdentifier: BeritaCell.identifier)
<<<<<<< HEAD
        beritaTableView.register(LoadingCell.nib, forCellReuseIdentifier: LoadingCell.identifier)
=======
        
        loadPage()
    }
    
    func loadPage() {
        self.presenter.loadFirstPage()
>>>>>>> 0556b430404c488d52b377db19542b27ed0cef91
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch NewsSection(rawValue: section) {
        case .match?:
            return 1
        case .news?:
            return 2
        case .loading?:
            return 1
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
        case .loading?:
            if let loadingCell = beritaTableView.dequeueReusableCell(withIdentifier: LoadingCell.identifier) as? LoadingCell {
                loadingCell.newsLoading.startAnimating()
                return loadingCell
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

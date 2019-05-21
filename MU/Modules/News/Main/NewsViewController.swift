//
//  NewsViewController.swift
//  MU
//
//  Created by fadielse on 12/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit
import PullToRefresh
import UIScrollView_InfiniteScroll

extension SegueConstants {
    enum News {
        static let showNewsDetail = "showNewsDetail"
    }
}

class NewsViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var beritaTableView: UITableView!
    
    var presenter: NewsPresenter!
    var newsData: [NewsData] = []
    
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
        
        setupTableView()
        loadPage()
    }
    
    func setupTableView() {
        beritaTableView.register(MatchCell.nib, forCellReuseIdentifier: MatchCell.identifier)
        beritaTableView.register(BeritaCell.nib, forCellReuseIdentifier: BeritaCell.identifier)
        
        // Add pull refresh on tableview
        let refresher = PullToRefresh()
        self.beritaTableView.addPullToRefresh(refresher) {
            self.presenter?.reloadFirstPage()
        }
        
        //Setup table view with infinity scroll
        setTableViewInfiniteScroll()
    }

    func setTableViewInfiniteScroll() {
        
        //Add view on bottom tableview
        beritaTableView.bottomLoading(withView: self.view)
        
        //Stop infinity view animation and reset scroll state
        beritaTableView.setShouldShowInfiniteScrollHandler({[unowned self] _ in
            return self.presenter?.hasNext ?? false //set has next value with false
        })
        
        //Add infinity view on tableview and load table view with new data
        beritaTableView.addInfiniteScroll {[unowned self](_) -> Void in
            self.presenter?.loadNextPage()
        }
    }
    
    //Load data into tableview
    func loadPage() {
        self.presenter.loadFirstPage()
    }
}

extension NewsViewController: NewsView {
    func showLoading() {
        self.showBlockLoading(withView: self.view)
    }
    
    func hideLoading() {
        self.stopBlockLoading()
        beritaTableView.endRefreshing(at: .top)
        beritaTableView.finishInfiniteScroll()
    }
    
    func getListNewsSuccess() {
        newsData = presenter.getNewsItem()
        beritaTableView.reloadData()
    }
    
    func getListNewsFailed(withErrorException error: ErrorExceptionAPI) {
        if error.isTypeErrorConvertingJson() {
            self.showShowServerError(withView: self.view)
        } else if error.isTypeInternalServerError() {
            self.showShowServerError(withView: self.view)
        } else if error.isTypeNoInternetConnection() {
            self.showErrorConnection(withView: self.view)
        }
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
            return newsData.count
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
                if self.newsData.indices.contains(indexPath.row) {
                    let data = newsData[indexPath.row]
                    newsCell.newsData = data
                }
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
        
        let activityVC = UIActivityViewController(activityItems: ["\(shareText)", "\(shareLink)"], applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }

}

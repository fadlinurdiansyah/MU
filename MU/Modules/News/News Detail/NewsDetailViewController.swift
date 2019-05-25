//
//  NewsDetailViewController.swift
//  MU
//
//  Created by NDS on 18/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit
import Hero

extension SegueConstants {
    enum NewsDetail {
        // TODO: Add segue ids
    }
}

class NewsDetailViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var newsDetailTableView: UITableView!
    @IBOutlet weak var detailNewsImage: UIImageView!
    @IBOutlet weak var descNewsLabel: UILabel!
    
    var presenter: NewsDetailPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NewsDetailPresenter.config(withNewsDetailViewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.makeTransparant()
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        self.view.hero.modifiers = [.source(heroID: "cell-\(presenter.getHeroId())")]
        newsDetailTableView.register(NewsDetailCell.nib, forCellReuseIdentifier: NewsDetailCell.identifier)
        
        setupNavbar()
        setupUI()
    }
    
    func setupNavbar() {
        
        let backButton = UIBarButtonItem(image: UIImage(named: "ic-back-shadow")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleBackView))
        
        let shareButton = UIBarButtonItem(image: UIImage(named: "ic-share-shadow")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleShare))
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = shareButton
        
    }
    
    func setupUI() {
        guard
            let data = presenter.getNewsData(),
            let pictureStringURL = data.fullPicture,
            let message = data.message
        else {
            self.handleBackView()
            return
        }
        
        detailNewsImage.hero.id = "cell-image-\(presenter.getHeroId())"
        detailNewsImage.hero.modifiers = [.fade]
        detailNewsImage.sd_setImage(with: pictureStringURL.toUrl(), placeholderImage: UIImage(named: "img-placeholder"))
        
        descNewsLabel.hero.id = "cell-label-\(presenter.getHeroId())"
        descNewsLabel.hero.modifiers = [.fade]
        descNewsLabel.text = message
    }
    
    @objc func handleBackView() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleShare() {
        
        let link = presenter.getLinkShare()
        let shareText = presenter.getTextShare()
        
        let activityVC = UIActivityViewController(activityItems: ["\(shareText)", "\(link)"], applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
}

extension NewsDetailViewController: NewsDetailView {
    // TODO: implement view methods
}

extension NewsDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = newsDetailTableView.dequeueReusableCell(withIdentifier: NewsDetailCell.identifier, for: indexPath) as? NewsDetailCell {
            return cell
        }
        return UITableViewCell()
    }
    
}

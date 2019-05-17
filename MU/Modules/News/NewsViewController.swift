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
    }
}

extension NewsViewController: NewsView {
    // TODO: implement view methods
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numSection = section
        
        switch numSection {
        case 0:
            return 1
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let numOindexInSection = (indexPath.section)
        
        switch numOindexInSection {
        case 0:
            if let matchCell = beritaTableView.dequeueReusableCell(withIdentifier: MatchCell.identifier, for: indexPath) as? MatchCell {
                return matchCell
            }
        case 1:
            if let newsCell = beritaTableView.dequeueReusableCell(withIdentifier: BeritaCell.identifier, for: indexPath) as? BeritaCell {
                return newsCell
            }
        default:
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

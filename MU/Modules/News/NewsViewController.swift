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
    
    var presenter: NewsPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NewsPresenter.config(withNewsViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NewsViewController: NewsView {
    // TODO: implement view methods
}

//
//  UITableView+InfiniteScroll.swift
//  MU
//
//  Created by fadielse on 20/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

extension UITableView {
    
    func bottomLoading(withView view: UIView) {
        let landing = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 25))
        let spiner = UIActivityIndicatorView(frame: landing.frame)
        spiner.center = CGPoint(x: landing.center.x - 40, y: landing.center.y)
        spiner.color = ColorConstants.primaryRed
        spiner.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        let label = UILabel(frame: landing.frame)
        label.frame.origin = CGPoint(x: spiner.center.x + 20, y: 0)
        label.frame.size = CGSize(width: view.frame.width - (view.frame.width / 3), height: label.frame.height)
        label.text = "Memuat Data"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        landing.addSubview(label)
        landing.addSubview(spiner)
        spiner.startAnimating()
        
        self.infiniteScrollIndicatorView = landing
        self.infiniteScrollIndicatorMargin = 25
    }
}

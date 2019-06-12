//
//  AccountViewController.swift
//  MU
//
//  Created by NDS on 12/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

extension SegueConstants {
    enum Account {
        // TODO: Add segue ids
    }
}

class AccountViewController: ButtonBarPagerTabStripViewController {
    
    // MARK: Properties
    
    var presenter: AccountPresenter!
    
    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AccountPresenter.config(withAccountViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = purpleInspireColor
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = self?.purpleInspireColor
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let personalView = UIStoryboard(name: "Personal", bundle: nil).instantiateViewController(withIdentifier: "PersonalViewController")
        
        let adminView = UIStoryboard(name: "Admin", bundle: nil).instantiateViewController(withIdentifier: "AdminViewController")
        
        return [personalView, adminView]
    }
}

extension AccountViewController: AccountView {
    // TODO: implement view methods
}

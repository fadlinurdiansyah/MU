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
    @IBOutlet weak var scrollViewContainer: UIScrollView!
    
    var presenter: AccountPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AccountPresenter.config(withAccountViewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarView?.backgroundColor = .clear
        navigationController?.navigationBar.makeTransparant()
    }
    
    override func viewDidLoad() {
        setupPageMenu() // Must call before super.viewDidLoad()
        super.viewDidLoad()
    }
    
    // Page menu with library XLPagerTabStrip
    // change page menu bar style
    func setupPageMenu() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = ColorConstants.primaryRed
        settings.style.buttonBarItemFont = UIFont(name: "Mukta", size: 16) ?? UIFont.systemFont(ofSize: 16)
        settings.style.selectedBarHeight = 3.3
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.rgb(red: 169, green: 167, blue: 167)
            newCell?.label.textColor = .black
        }
    }
    
    // Set child view from page menu
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let personalView = UIStoryboard(name: "Personal", bundle: nil).instantiateViewController(withIdentifier: "PersonalViewController")
        
        let adminView = UIStoryboard(name: "Admin", bundle: nil).instantiateViewController(withIdentifier: "AdminViewController")
        
        return [personalView, adminView]
    }
}

extension AccountViewController: AccountView {
    // TODO: implement view methods
}

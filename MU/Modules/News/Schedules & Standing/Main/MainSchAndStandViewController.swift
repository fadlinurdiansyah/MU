//
//  MainSchAndStandViewController.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit
import Parchment

extension SegueConstants {
    enum MainSchAndStand {
        // TODO: Add segue ids
    }
}

class MainSchAndStandViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: MainSchAndStandPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MainSchAndStandPresenter.config(withMainSchAndStandViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupParchment()
    }
    
    // Parchment is page menu library
    func setupParchment() {
        
        // Load each of the view controllers you want to embed
        // from storyboard.
        let storyboardSchedules = UIStoryboard(name: "Schedules", bundle: nil)
        let storyboardStanding = UIStoryboard(name: "Standing", bundle: nil)
        let schView = storyboardSchedules.instantiateViewController(withIdentifier: "SchedulesViewController")
        let standView = storyboardStanding.instantiateViewController(withIdentifier: "StandingViewController")
        
        // Initialize a FixedPagingViewController and pass
        // in the view controllers.
        let pagingViewController = FixedPagingViewController(viewControllers: [
            schView,
            standView
        ])
        
        // Make sure you add the PagingViewController as a child view
        // controller and constrain it to the edges of the view.
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        
        //Change Attribute Parchment
        pagingViewController.indicatorColor = ColorConstants.primaryRed
        pagingViewController.indicatorOptions = .visible(
            height: 4,
            zIndex: Int.max,
            spacing: UIEdgeInsets.zero,
            insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        pagingViewController.borderColor = UIColor.rgb(red: 154, green: 150, blue: 150)
        pagingViewController.borderOptions = .visible(
            height: 1,
            zIndex: Int.max - 1,
            insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        pagingViewController.font = UIFont.init(name: "Mukta", size: 16)!
        pagingViewController.selectedFont = UIFont.init(name: "Mukta", size: 16)!
        pagingViewController.textColor = UIColor.rgb(red: 169, green: 167, blue: 167)
        pagingViewController.selectedTextColor = UIColor.black
        
    }
}

extension MainSchAndStandViewController: MainSchAndStandView {
    // TODO: implement view methods
}

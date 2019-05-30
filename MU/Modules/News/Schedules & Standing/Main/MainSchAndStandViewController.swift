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
        
    }
}

extension MainSchAndStandViewController: MainSchAndStandView {
    // TODO: implement view methods
}

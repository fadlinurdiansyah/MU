//
//  OnBoardingViewController.swift
//  MU
//
//  Created by fadielse on 11/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit
import SwiftyOnboard

extension SegueConstants {
    enum OnBoarding {
        static let goToHomePage = "goToHomePage"
    }
}

class OnBoardingViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var viewOnBoarding: SwiftyOnboard!
    
    var presenter: OnBoardingPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        OnBoardingPresenter.config(withOnBoardingViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOnBoarding.style = .light
        viewOnBoarding.delegate = self
        viewOnBoarding.dataSource = self
        viewOnBoarding.backgroundColor = ColorConstants.primaryRed
    }
    
    @objc func handleContinue(sender: UIButton) {
        let page = sender.tag
        let nextPage = sender.tag + 1
        
        if page == 3 {
            performSegue(withIdentifier: SegueConstants.OnBoarding.goToHomePage, sender: nil)
        } else {
            viewOnBoarding?.goToPage(index: nextPage, animated: true)
        }
    }
}

extension OnBoardingViewController: OnBoardingView {
    // TODO: implement view methods
}

extension OnBoardingViewController: SwiftyOnboardDelegate, SwiftyOnboardDataSource {
    func swiftyOnboardNumberOfPages(_ swiftyOnboard: SwiftyOnboard) -> Int {
        return 4
    }
    
    func swiftyOnboardPageForIndex(_ swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage? {
        let view = CustomPage.instanceFromNib() as? CustomPage
        view?.image.image = presenter.getOnBoardingImage(withCurrentPage: index)
        view?.labelTitle.text = presenter.getOnBoardingTitle(withCurrentPage: index)
        view?.labelSubTitle.text = presenter.getOnBoardingDescription(withCurrentPage: index)
        
        return view
    }
    
    func swiftyOnboardViewForOverlay(_ swiftyOnboard: SwiftyOnboard) -> SwiftyOnboardOverlay? {
        let overlay = CustomOverlay.instanceFromNib() as? CustomOverlay
        overlay?.buttonContinue.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
        
        return overlay
    }
    
    func swiftyOnboardOverlayForPosition(_ swiftyOnboard: SwiftyOnboard, overlay: SwiftyOnboardOverlay, for position: Double) {
        guard let overlay = overlay as? CustomOverlay else {
            return
        }
        
        let currentPage = Int(round(position))
        overlay.contentControl.currentPage = currentPage
        overlay.buttonContinue.tag = currentPage
        overlay.buttonContinue.setTitle(presenter.getOnBoardingButtonTitle(withCurrentPage: currentPage), for: .normal)
    }
}

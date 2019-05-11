//
//  OnBoardingPresenter.swift
//  MU
//
//  Created by fadielse on 11/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol OnBoardingViewPresenter: class {
    init(view: OnBoardingView)
    
    func getOnBoardingImage(withCurrentPage page: Int) -> UIImage?
    func getOnBoardingTitle(withCurrentPage page: Int) -> String?
    func getOnBoardingDescription(withCurrentPage page: Int) -> String?
    func getOnBoardingButtonTitle(withCurrentPage page: Int) -> String?
}

protocol OnBoardingView: class {
    // TODO: Declare view methods
}

class OnBoardingPresenter: OnBoardingViewPresenter {
    
    static func config(withOnBoardingViewController viewController: OnBoardingViewController) {
        let presenter = OnBoardingPresenter(view: viewController)
        viewController.presenter = presenter
    }
    
    let view: OnBoardingView
    
    required init(view: OnBoardingView) {
        self.view = view
    }
    
    func getOnBoardingImage(withCurrentPage page: Int) -> UIImage? {
        return UIImage(named: "img-onBoarding\(page)")
    }
    
    func getOnBoardingTitle(withCurrentPage page: Int) -> String? {
        switch page {
        case 0:
            return "We Are United"
        case 1:
            return "Semua Tentang Man United"
        case 2:
            return "Ayo... Nonton Bareng"
        case 3:
            return "Jadikan dirimu Man United"
        default:
            return nil
        }
    }
    
    func getOnBoardingDescription(withCurrentPage page: Int) -> String? {
        switch page {
        case 0:
            return "Jadilah fans Manchester United sejati  Born United, Live United, Die United"
        case 1:
            return "Dapatkan berita, jadwal pertandingan  hingga klasemen semuanya dalam Bahasa Indonesia"
        case 2:
            return "Temukan lokasi nonton bareng Manchester United di dekatmu"
        case 3:
            return "Cari koleksi dan acara Manchester United kini lebih mudah dan cepat"
        default:
            return nil
        }
    }
    
    func getOnBoardingButtonTitle(withCurrentPage page: Int) -> String? {
        switch page {
        case 3:
            return "Ayo Mulai"
        default:
            return "Berikutnya"
        }
    }
}

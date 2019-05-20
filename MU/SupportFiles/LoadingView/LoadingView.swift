//
//  LoadingView.swift
//  MU
//
//  Created by fadielse on 20/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

public extension UIView {
    
    public class func instantiateFromNib<T: UIView>(_ viewType: T.Type) -> T {
        let url = URL(string: NSStringFromClass(viewType))
        return Bundle.main.loadNibNamed((url?.pathExtension)!, owner: nil, options: nil)!.first as! T
    }
    
    public class func instantiateFromNib() -> Self {
        return instantiateFromNib(self)
    }
}

class LoadingView: UIView {
    private let kImageNoInternet = "img-no-connection"
    private let kImageServerError = "img-system-error"
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var warningImage: UIImageView!
    
    func showBlockLoading() {
        indicator.startAnimating()
        indicator.isHidden = false
        warningImage.isHidden = true
    }
    
    func showNoConnection() {
        indicator.stopAnimating()
        indicator.isHidden = true
        warningImage.isHidden = false
        warningImage.image = UIImage(named: self.kImageNoInternet)
    }
    
    func showServerError() {
        indicator.stopAnimating()
        indicator.isHidden = true
        warningImage.isHidden = false
        warningImage.image = UIImage(named: self.kImageServerError)
    }
    
    func stop() {
        self.removeFromSuperview()
    }
}

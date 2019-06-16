//
//  LoginViewController.swift
//  MU
//
//  Created by NDS on 07/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum Login {
        // TODO: Add segue ids
    }
}

class LoginViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var btnLoginGoogle: UIButton!
    
    var presenter: LoginPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LoginPresenter.config(withLoginViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoginViewController: LoginView {
    // TODO: implement view methods
}

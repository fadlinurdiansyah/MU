//
//  EditProfileViewController.swift
//  MU
//
//  Created by NDS on 15/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum EditProfile {
        // TODO: Add segue ids
    }
}

class EditProfileViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: EditProfilePresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        EditProfilePresenter.config(withEditProfileViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension EditProfileViewController: EditProfileView {
    // TODO: implement view methods
}

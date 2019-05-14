//
//  NobarViewController.swift
//  MU
//
//  Created by NDS on 15/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit

extension SegueConstants {
    enum Nobar {
        // TODO: Add segue ids
    }
}

class NobarViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var LabelLocation: UILabel!
   
    
    var presenter: NobarPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NobarPresenter.config(withNobarViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NobarViewController: NobarView {
    // TODO: implement view methods
}

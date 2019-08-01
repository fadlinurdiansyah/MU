//
//  LoginViewController.swift
//  MU
//
//  Created by NDS on 07/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

extension SegueConstants {
    enum Login {
        // TODO: Add segue ids
    }
}

class LoginViewController: BaseViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var btnGoogleLogin: UIButton!
    
    var presenter: LoginPresenter!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LoginPresenter.config(withLoginViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
        
    }
    @IBAction func btnLoginTapped(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()

    }
}

extension LoginViewController: LoginView {
    // TODO: implement view methods
}

extension LoginViewController: GIDSignInUIDelegate {
    
}

extension LoginViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            let imageURL = user.profile.imageURL(withDimension: 400)
            
            print(userId, " ", idToken, " ", fullName, " ", givenName, " ", familyName, " ", email, " ", imageURL)
        }
    }
}

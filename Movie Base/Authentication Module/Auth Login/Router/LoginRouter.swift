//
//  AuthLoginRouter.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation

class LoginRouter: LoginRouterInput {
    weak var loginViewController: LoginViewController!
    
    func transitionToMainScreen() {
        let homeViewController = loginViewController.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homveViewController) as? HomeViewController
        
        loginViewController.view.window?.rootViewController = homeViewController
        loginViewController.view.window?.makeKeyAndVisible()
    }
}

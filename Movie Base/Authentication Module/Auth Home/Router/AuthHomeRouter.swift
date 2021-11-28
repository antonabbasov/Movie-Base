//
//  AuthHomeRouter.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation

class AuthHomeRouter: AuthHomeRouterInput {
    weak var authHomeViewController: AuthHomeViewController!
    
    func transitionToLoginScreen() {
        authHomeViewController.performSegue(withIdentifier: "homeToLogin", sender: nil)
    }
    
    func transitionToSignUpScreen() {
        authHomeViewController.performSegue(withIdentifier: "homeToSignUp", sender: nil)
    }
}

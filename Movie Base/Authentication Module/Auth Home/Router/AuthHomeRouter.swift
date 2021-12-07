//
//  AuthHomeRouter.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

final class AuthHomeRouter: AuthHomeRouterInput {
    
    //MARK: - Variables
    
    private weak var authHomeViewController: AuthHomeViewController?
    
    //MARK: - Init
    
    init(authHomeViewController: AuthHomeViewController) {
        self.authHomeViewController = authHomeViewController
    }
    
    //MARK: - AuthHomeRouterInput
    
    internal func transitionToLoginScreen() {
        authHomeViewController?.performSegue(withIdentifier: "homeToLogin", sender: nil)
    }
    
    internal func transitionToSignUpScreen() {
        authHomeViewController?.performSegue(withIdentifier: "homeToSignUp", sender: nil)
    }    
}

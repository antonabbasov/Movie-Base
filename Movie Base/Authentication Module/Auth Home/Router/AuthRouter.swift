//
//  AuthHomeRouter.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

final class AuthRouter: AuthRouterInput {
    
    //MARK: - Variables
    
    private weak var authHomeViewController: AuthViewController?
    
    //MARK: - Init
    
    init(authHomeViewController: AuthViewController) {
        self.authHomeViewController = authHomeViewController
    }
    
    //MARK: - AuthRouterInput
    
    func transitionToLoginScreen() {
        authHomeViewController?.performSegue(withIdentifier: Constants.Storyboard.authToLogin, sender: nil)
    }
    
    func transitionToSignUpScreen() {
        authHomeViewController?.performSegue(withIdentifier: Constants.Storyboard.authToSignUp, sender: nil)
    }
    
    func transitionToMainScreen() {
        authHomeViewController?.performSegue(withIdentifier: Constants.Storyboard.authToMainScreenSegue, sender: nil)
    }
}

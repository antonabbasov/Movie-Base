//
//  Presenter.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

final class AuthHomePresenter: AuthHomeViewControllerOutput {
    
    //MARK: - Variables
    
    private var router: AuthHomeRouterInput
    
    //MARK: - Init
    
    init(authHomeRouter: AuthHomeRouterInput) {
        self.router = authHomeRouter
    }
    
    //MARK: - AuthHomeViewControllerOutput
    
    internal func didPressLoginButton() {
        //router.transitionToLoginScreen()
    }
    
    internal func didPressSignUpButton() {
        //router.transitionToSignUpScreen()
    }
}

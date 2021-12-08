//
//  Presenter.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation

final class AuthPresenter: AuthViewControllerOutput {
    
    //MARK: - Variables
    
    private var router: AuthRouterInput
    
    private func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    //MARK: - Init
    
    init(authHomeRouter: AuthRouterInput) {
        self.router = authHomeRouter
    }
    
    //MARK: - AuthViewControllerOutput
    
    func didPressLoginButton() {
        router.transitionToLoginScreen()
    }
    
    func didPressSignUpButton() {
        router.transitionToSignUpScreen()
    }
    
    func viewDidLoad() {
        if (isLoggedIn()) {
            router.transitionToMainScreen()
        }
    }
    
}

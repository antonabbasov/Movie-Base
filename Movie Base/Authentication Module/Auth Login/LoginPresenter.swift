//
//  Presenter.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation

class LoginPresenter: LoginViewControllerOutput, LoginInteractorOutput {
   
    weak var view: LoginViewController!
    var interactor: LoginInteractor!
    var router: LoginRouter!
    
    //MARK: - LoginViewControllerOutpur
    func didPressLogin(email: String?, password: String?) {
        interactor.loginUser(email: email, password: password)
    }
    //MARK: - LoginInteractorOutput
    
    func didFinishLoginingUser() {
        router.transitionToMainScreen()
    }
    
    func errorLoginingUser(_ error: String) {
        view.showError(error)
    }
}

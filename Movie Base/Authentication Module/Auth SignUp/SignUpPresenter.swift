//
//  SignUpPresenter.swift
//  Movie Base
//
//  Created by Anton on 29.11.2021.
//

import Foundation

class SignUpPresenter: SignUpViewControllerOutput, SignUpInteractorOutput {
   
    weak var view: SignUpViewController!
    var interactor: SignUpInteractor!
    var router: SignUpRouter!
    
    
    func didPressSignUp(email: String?, password: String?, firstname: String?, lastname: String?) {
        interactor.signUpUser(email: email, password: password, firstname: firstname, lastname: lastname)
    }
    
    func didFinishSignUpUser() {
        router.transitionToMainScreen()
    }
    
    func errorSignUpUser(_ error: String) {
        view.showError(error)
    }
}

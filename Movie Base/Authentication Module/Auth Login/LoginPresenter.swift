//
//  Presenter.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

final class LoginPresenter: LoginViewControllerOutput, LoginInteractorOutput {
    
    //MARK: - Variables
    
    private weak var view: LoginViewController?
    private var interactor: LoginInteractor
    private var router: LoginRouter
    
    //MARK: - Init
    
    init(view: LoginViewController, interactor: LoginInteractor, router: LoginRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Instance Methods
    
    private func validateUserCredentials(email: String?, password: String?) -> String? {
        if  (email?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" ||
                (password?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" {
            
            return Constants.AuthErrors.emptyFieldsError
        } else {
            return nil
        }
    }
    
    private func obtainClearedField(_ string: String?) -> String {
        if let clearedField = string {
            return clearedField.trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            errorLoginingUser(Constants.InternalErrors.clearingFieldsError)
            return ""
        }
    }
    
    //MARK: - LoginViewControllerOutput
    
    func didPressLogin(email: String?, password: String?) {
        let error = validateUserCredentials(email: email, password: password)
        
        if let error = error {
            errorLoginingUser(error)
        } else {
            let email = obtainClearedField(email)
            let password = obtainClearedField(password)
            if (!email.isEmpty && !password.isEmpty) {
                interactor.loginUser(email: email, password: password)
            }
        }
    }
    
    //MARK: - LoginInteractorOutput
    
    func didFinishLoginingUser() {
        router.transitionToMainScreen()
    }
    
    func errorLoginingUser(_ error: String) {
        view?.showError(error)
    }
}

//
//  SignUpPresenter.swift
//  Movie Base
//
//  Created by Anton on 29.11.2021.
//

final class SignUpPresenter: SignUpViewControllerOutput, SignUpInteractorOutput {
    
    //MARK: - Variables
    
    private weak var view: SignUpViewController?
    private var interactor: SignUpInteractor
    private var router: SignUpRouter
    
    //MARK: - Init
    
    init(view: SignUpViewController, interactor: SignUpInteractor, router: SignUpRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Instance Methods
    
    private func validateUserCredentials(email: String?, password: String?, firstname: String?, lastname: String?) -> String? {
        if  (email?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" ||
                (password?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" ||
                (firstname?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" ||
                (lastname?.trimmingCharacters(in: .whitespacesAndNewlines)) == ""{
            
            return Constants.AuthErrors.emptyFieldsError
        }
        
        let cleanedPassword = obtainClearedField(password)
        if !Utilities.isPasswordValid(cleanedPassword) {
            return Constants.AuthErrors.badPassswordError
        }
        
        return nil
    }
    
    private func obtainClearedField(_ string: String?) -> String {
        if let clearedField = string {
            return clearedField.trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            errorSignUpUser(Constants.InternalErrors.clearingFieldsError)
            return ""
        }
    }
    
    internal func errorSignUpUser(_ error: String) {
        view?.showError(error)
    }
    
    
    //MARK: - SignUpViewControllerOutput
    
    internal func didPressSignUp(email: String?, password: String?, firstname: String?, lastname: String?) {
        let error = validateUserCredentials(email: email, password: password, firstname: firstname, lastname: lastname)
        if let error = error {
            errorSignUpUser(error)
        } else {
            
            let cleanedPassword = obtainClearedField(password)
            let cleanedEmail = obtainClearedField(email)
            let cleanedFirstname = obtainClearedField(firstname)
            let cleanedLastname = obtainClearedField(lastname)
            
            if (!cleanedEmail.isEmpty && !cleanedPassword.isEmpty && !cleanedFirstname.isEmpty && !cleanedLastname.isEmpty) {
                interactor.signUpUser(email: cleanedEmail, password: cleanedPassword, firstname: cleanedFirstname, lastname: cleanedLastname)
            }
        }
    }
    
    //MARK: - SignUpInteractorOutput
    
    internal func didFinishSignUpUser() {
        router.transitionToMainScreen()
    }
}

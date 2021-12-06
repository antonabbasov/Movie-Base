//
//  SignUpInteractor.swift
//  Movie Base
//
//  Created by Anton on 29.11.2021.
//

final class SignUpInteractor: SignUpInteractorInput {
    
    //MARK: - Variables
    
    weak var interactorOutput: SignUpInteractorOutput?
    private var firebaseManager: FirebaseManager
    
    //MARK: - Init
    
    init(firebaseManager: FirebaseManager) {
        self.firebaseManager = firebaseManager
    }
    
    //MARK: - SignUpInteractorInput
    
    func signUpUser(email: String, password: String, firstname: String, lastname: String) {
        firebaseManager.signUpUser(email: email, password: password, firstname: firstname, lastname: lastname) { [weak self] (completionSuccses: Bool) in
            if completionSuccses {
                self?.interactorOutput?.didFinishSignUpUser()
            } else {
                self?.interactorOutput?.errorSignUpUser(Constants.AuthErrors.errorSignUpingUser)
            }
        }
    }
}

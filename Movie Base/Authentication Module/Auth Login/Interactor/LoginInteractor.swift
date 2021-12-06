//
//  AuthLoginInteractor.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

final class LoginInteractor: LoginInteractorInput {
    
    //MARK: - Variables
    
    weak var output: LoginInteractorOutput?
    private let firebaseManager: FirebaseManager
    
    //MARK: - Init
    
    init (firebaseManager: FirebaseManager) {
        self.firebaseManager = firebaseManager
    }
    
    //MARK: - LoginInteractorInput
    internal func loginUser(email: String, password: String) {
        firebaseManager.loginUser(email: email, password: password) { [weak self] (completionSuccses: Bool) in
            if completionSuccses {
                self?.output?.didFinishLoginingUser()
            } else {
                self?.output?.errorLoginingUser(Constants.AuthErrors.errorLoginingUser)
            }
        }
    }
}

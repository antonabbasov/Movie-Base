//
//  AuthLoginInteractor.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation

final class LoginInteractor: LoginInteractorInput {
    
    //MARK: - Variables
    
    weak var output: LoginInteractorOutput?
    private let firebaseManager: FirebaseManager
    
    //MARK: - Init
    
    init (firebaseManager: FirebaseManager) {
        self.firebaseManager = firebaseManager
    }
    
    //MARK: - LoginInteractorInput
    func loginUser(email: String, password: String) {
        firebaseManager.loginUser(email: email, password: password) { [weak self] (completionSuccses: Bool) in
            if completionSuccses {
                self?.output?.didFinishLoginingUser()
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                UserDefaults.standard.synchronize()
            } else {
                self?.output?.errorLoginingUser(Constants.AuthErrors.errorLoginingUser)
            }
        }
    }
}

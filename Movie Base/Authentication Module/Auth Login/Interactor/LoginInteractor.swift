//
//  AuthLoginInteractor.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation

class LoginInteractor: LoginInteractorInput {
    
    weak var output: LoginInteractorOutput!
    var firebaseManager: FirebaseManager!
    
    //MARK: - DATA MANAGER
    
    //MARK: - LoginInteractorInput
    func loginUser(email: String?, password: String?) {
        var error = validateUserCredentials(email: email, password: password)
        
        if error != nil {
            output.errorLoginingUser(error!)
        } else {
            let email = obtainClearedField(email!)
            let password = obtainClearedField(password!)
            error = firebaseManager.loginUser(email: email, password: password)
            if error != nil {
                output.errorLoginingUser(error!)
            } else {
                output.didFinishLoginingUser()
            }
    }
    }
    
    private func validateUserCredentials(email: String?, password: String?) -> String? {
        if  (email?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" ||
            (password?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" {
            
            return "Please filled in all fields"
        } else {
            return nil
        }
    }
    
    private func obtainClearedField(_ string: String) -> String {
        return string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

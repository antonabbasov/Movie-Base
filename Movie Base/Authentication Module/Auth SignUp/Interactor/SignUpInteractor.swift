//
//  SignUpInteractor.swift
//  Movie Base
//
//  Created by Anton on 29.11.2021.
//

import Foundation

class SignUpInteractor: SignUpInteractorInput {
    
    
    weak var interactorOutput: SignUpInteractorOutput!
    var firebaseManager: FirebaseManager!
    
    //MARK: - SignUpInteractorInput 
    func signUpUser(email: String?, password: String?, firstname: String?, lastname: String?) {
        var error = validateUserCredentials(email: email, password: password, firstname: firstname, lastname: lastname)
        if error != nil {
            interactorOutput.errorSignUpUser(error!)
        } else {
            let email = obtainClearedField(email!)
            let password = obtainClearedField(password!)
            let firstname = obtainClearedField(firstname!)
            let lastname = obtainClearedField(lastname!)
            error = firebaseManager.signUpUser(email: email, password: password, firstname: firstname, lastname: lastname)
            if error != nil {
                interactorOutput.errorSignUpUser(error!)
            } else {
                interactorOutput.didFinishSignUpUser()
            }
    }
    }
    
    private func validateUserCredentials(email: String?, password: String?, firstname: String?, lastname: String?) -> String? {
        
        
        if  (email?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" ||
            (password?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" ||
            (firstname?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" ||
            (lastname?.trimmingCharacters(in: .whitespacesAndNewlines)) == ""{
            
            return "Please filled in all fields"
        }
        
        let cleanedPassword = obtainClearedField(password!)
        
        if !Utilities.isPasswordValid(cleanedPassword) {
            return "Please make sure your password is at least 8 characters< contains a speial character and a number."
        }
        
        return nil
    }
    
    private func obtainClearedField(_ string: String) -> String {
        return string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}



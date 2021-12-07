//
//  FirebaseManager.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation
import Firebase


class FirebaseManager {
    func loginUser(email: String, password: String) -> String? {
        
        var loginError: String?
        
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            
            if error != nil {
                loginError = error?.localizedDescription
            } else {
                let result = result
            }
        }
        return loginError
    }
    
    func signUpUser(email: String, password: String, firstname: String, lastname: String) -> String? {
        var signUpError: String?
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if err != nil {
                signUpError = "Error creating user."
            } else {
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["firstname": firstname, "lastname": lastname, "UID": result!.user.uid]) { error in
                    if error != nil {
                        signUpError = "Error saving user data" //юзер был создан но пользователь не сможет зайти надо подумать
                    }
                }
            }
    }
        return signUpError
}
}


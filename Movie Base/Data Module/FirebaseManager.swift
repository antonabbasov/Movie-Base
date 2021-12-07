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
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                loginError = "Error logining user."
            }
        }
        return loginError
    }
}

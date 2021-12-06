//
//  FirebaseManager.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation
import Firebase


class FirebaseManager {
    func loginUser(email: String, password: String,  completionSuccses: @escaping (Bool) -> ()) {
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if error != nil {
                completionSuccses(false)
            } else {
                completionSuccses(true)
            }
        }
    }
    
    func signUpUser(email: String, password: String, firstname: String, lastname: String, completionSuccses: @escaping (Bool) -> ()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if err != nil {
                completionSuccses(false)
            } else {
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["firstname": firstname, "lastname": lastname, "UID": result!.user.uid]) { error in
                    if error != nil {
                        completionSuccses(false) //юзер был создан но пользователь не сможет зайти надо подумать
                    } else {
                        completionSuccses(true)
                    }
                }
            }
        }
    }
}


//
//  SignUpInteractorInput.swift
//  Movie Base
//
//  Created by Anton on 29.11.2021.
//

protocol SignUpInteractorInput: AnyObject {
    func signUpUser(email: String, password: String, firstname: String, lastname: String)
}

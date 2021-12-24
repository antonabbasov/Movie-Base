//
//  AuthLoginInteractorInput.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

protocol LoginInteractorInput: AnyObject {
    func loginUser(email: String, password: String)
}

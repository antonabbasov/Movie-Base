//
//  SignUpInteractorOutput.swift
//  Movie Base
//
//  Created by Anton on 29.11.2021.
//

protocol SignUpInteractorOutput: AnyObject {
    func didFinishSignUpUser()
    func errorSignUpUser(_ error: String)
}

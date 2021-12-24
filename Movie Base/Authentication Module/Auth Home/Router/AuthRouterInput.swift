//
//  AuthHomeRouterInput.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

protocol AuthRouterInput: AnyObject {
    func transitionToLoginScreen()
    func transitionToSignUpScreen()
    func transitionToMainScreen()
}

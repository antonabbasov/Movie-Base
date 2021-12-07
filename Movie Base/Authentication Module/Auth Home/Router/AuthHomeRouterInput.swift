//
//  AuthHomeRouterInput.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation

protocol AuthHomeRouterInput: AnyObject {
    func transitionToLoginScreen()
    func transitionToSignUpScreen()
}

//
//  SignUpViewControllerOutput.swift
//  Movie Base
//
//  Created by Anton on 29.11.2021.
//

import Foundation

protocol SignUpViewControllerOutput: AnyObject {
    func didPressSignUp(email: String?, password: String?, firstname: String?, lastname: String?)
}

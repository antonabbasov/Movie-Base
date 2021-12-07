//
//  AuthLoginViewControllerOutput.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation

protocol LoginViewControllerOutput: AnyObject {
    func didPressLogin(email: String?, password: String?)
}

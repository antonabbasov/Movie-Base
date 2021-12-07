//
//  AuthLoginViewControllerInput.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation

protocol LoginViewControllerInput: AnyObject {
    func showError(_ message: String)
}

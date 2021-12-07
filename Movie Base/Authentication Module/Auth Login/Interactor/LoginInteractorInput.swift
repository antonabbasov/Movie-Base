//
//  AuthLoginInteractorInput.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation

protocol LoginInteractorInput: AnyObject {
    func loginUser(email: String?, password: String?)
}

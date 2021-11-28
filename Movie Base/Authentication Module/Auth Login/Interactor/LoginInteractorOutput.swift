//
//  AuthLoginInteractorOutput.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation

protocol LoginInteractorOutput: AnyObject {
    func didFinishLoginingUser()
    func errorLoginingUser(_ error: String)
}

//
//  AuthLoginInteractorOutput.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

protocol LoginInteractorOutput: AnyObject {
    func didFinishLoginingUser()
    func errorLoginingUser(_ error: String)
}

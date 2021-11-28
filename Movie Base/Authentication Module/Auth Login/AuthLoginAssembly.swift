//
//  AuthLoginAssembly.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation
import UIKit

class AuthLoginAssembly: NSObject {
    @IBOutlet weak var loginViewController: UIViewController!
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let loginViewController = loginViewController as? LoginViewController else { return }
        
        let loginPresenter = LoginPresenter()
        let loginRouter = LoginRouter()
        let loginInteractor = LoginInteractor()
        
        let firebaseManager = FirebaseManager()
        
        loginViewController.loginViewOutput = loginPresenter
        loginPresenter.interactor = loginInteractor
        loginPresenter.router = loginRouter
        loginPresenter.view = loginViewController
        loginRouter.loginViewController = loginViewController
        loginInteractor.output = loginPresenter
        loginInteractor.firebaseManager = firebaseManager
        
    }
}

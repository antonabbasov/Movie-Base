//
//  AuthLoginAssembly.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import UIKit

final class AuthLoginAssembly: NSObject {
    
    //MARK: - Outlets
    
    @IBOutlet weak var loginViewController: UIViewController!
    
    //MARK: - NSObject
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let loginViewController = loginViewController as? LoginViewController else { return }
        
        let firebaseManager = FirebaseManager()
        let loginRouter = LoginRouter(loginViewCotroller: loginViewController)
        let loginInteractor = LoginInteractor(firebaseManager: firebaseManager)
        let loginPresenter = LoginPresenter(view: loginViewController, interactor: loginInteractor, router: loginRouter)
        
        loginInteractor.output = loginPresenter
        loginViewController.loginViewOutput = loginPresenter
    }
}

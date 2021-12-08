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
        let router = LoginRouter(loginViewCotroller: loginViewController)
        let interactor = LoginInteractor(firebaseManager: firebaseManager)
        let presenter = LoginPresenter(view: loginViewController, interactor: interactor, router: router)
        
        interactor.output = presenter
        loginViewController.loginViewOutput = presenter
    }
}

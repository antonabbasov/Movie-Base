//
//  SignUpAssembly.swift
//  Movie Base
//
//  Created by Anton on 29.11.2021.
//

import UIKit

final class SignUpAssembly: NSObject {
    
    //MARK: - Outlets
    
    @IBOutlet weak var signUpViewController: UIViewController!
    
    //MARK: - NSObject
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let signUpViewController = signUpViewController as? SignUpViewController else { return }
    
        let signUpRouter = SignUpRouter(signUpViewController: signUpViewController)
        let firebaseManager = FirebaseManager()
        let signUpInteractor = SignUpInteractor(firebaseManager: firebaseManager)
        let signUpPresenter = SignUpPresenter(view: signUpViewController, interactor: signUpInteractor, router: signUpRouter)
        
        signUpInteractor.interactorOutput = signUpPresenter
        signUpViewController.signUpViewOutput = signUpPresenter
    }
}

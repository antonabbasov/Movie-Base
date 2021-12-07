//
//  SignUpAssembly.swift
//  Movie Base
//
//  Created by Anton on 29.11.2021.
//

import Foundation
import UIKit

class SignUpAssembly: NSObject {

    @IBOutlet weak var signUpViewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let signUpViewController = signUpViewController as? SignUpViewController else { return }
        
        let signUpPresenter = SignUpPresenter()
        let signUpRouter = SignUpRouter()
        let signUpInteractor = SignUpInteractor()
        
        let firebaseManager = FirebaseManager()
        
        signUpViewController.signUpViewOutput = signUpPresenter
        
        signUpPresenter.interactor = signUpInteractor
        signUpPresenter.router = signUpRouter
        signUpPresenter.view = signUpViewController
        signUpRouter.signUpViewController = signUpViewController
        signUpInteractor.interactorOutput = signUpPresenter
        signUpInteractor.firebaseManager = firebaseManager
        
    }
}

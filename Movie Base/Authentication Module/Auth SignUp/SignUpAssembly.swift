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
    
        let router = SignUpRouter(signUpViewController: signUpViewController)
        let firebaseManager = FirebaseManager()
        let interactor = SignUpInteractor(firebaseManager: firebaseManager)
        let presenter = SignUpPresenter(view: signUpViewController, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        signUpViewController.signUpViewOutput = presenter
    }
}

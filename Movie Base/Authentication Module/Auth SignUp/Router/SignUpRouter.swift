//
//  SignUpRouter.swift
//  Movie Base
//
//  Created by Anton on 29.11.2021.
//

final class SignUpRouter: SigUpRouterInput {
    
    //MARK: - Variables
    
    private weak var signUpViewController: SignUpViewController?
    
    //MARK: - Init
    
    init(signUpViewController: SignUpViewController) {
        self.signUpViewController = signUpViewController
    }
    
    //MARK: - Instance Methods
    
    func transitionToMainScreen() {
        let homeViewController = signUpViewController?.storyboard?.instantiateViewController(identifier: Constants.Storyboard.mainScreenTabBarController) as? RootTabBarViewController
        
        signUpViewController?.view.window?.rootViewController = homeViewController
        signUpViewController?.view.window?.makeKeyAndVisible()
    }
}

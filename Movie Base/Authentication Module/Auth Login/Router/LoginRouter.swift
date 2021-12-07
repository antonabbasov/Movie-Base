//
//  AuthLoginRouter.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

final class LoginRouter: LoginRouterInput {
    
    //MARK: - Variables
    
    private weak var loginViewController: LoginViewController?
    
    //MARK: - Init
    
    init(loginViewCotroller: LoginViewController) {
        self.loginViewController = loginViewCotroller
    }
    
    //MARK: - Instance Methods
    
    func transitionToMainScreen() {
        let homeViewController = loginViewController?.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? RootTabBarViewController
        
        loginViewController?.view.window?.rootViewController = homeViewController
        loginViewController?.view.window?.makeKeyAndVisible()
    }
}

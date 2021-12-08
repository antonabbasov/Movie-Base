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
        loginViewController?.performSegue(withIdentifier: "loginToMain", sender: nil)
    }
}

//
//  LoginViewController.swift
//  Movie Base
//
//  Created by Anton on 24.11.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, LoginViewControllerInput {

    var loginViewOutput: LoginViewControllerOutput!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        errorLabel.isHidden = true
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        loginViewOutput.didPressLogin(email: emailTextField.text, password: passwordTextField.text)
    }
    
    //MARK: - LoginViewControllerInput
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
}

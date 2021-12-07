//
//  LoginViewController.swift
//  Movie Base
//
//  Created by Anton on 24.11.2021.
//

import UIKit
import Firebase

final class LoginViewController: UIViewController, LoginViewControllerInput {
    
    //MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Variables
    var loginViewOutput: LoginViewControllerOutput!
    
    // MARK: - Actions
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        loginViewOutput.didPressLogin(email: emailTextField.text, password: passwordTextField.text)
    }
    
    //MARK: - Instance methods
    
    private func setup() {
        errorLabel.isHidden = true
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.tintColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //MARK: - LoginViewControllerInput
    
    internal func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
}

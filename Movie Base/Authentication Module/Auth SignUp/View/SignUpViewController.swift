//
//  SignUpViewController.swift
//  Movie Base
//
//  Created by Anton on 24.11.2021.
//

import UIKit
import FirebaseAuth
import Firebase

final class SignUpViewController: UIViewController, LoginViewControllerInput {
    
    //MARK: - Outlets
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    //MARK: - Variables
    
    var signUpViewOutput: SignUpViewControllerOutput!
    
    //MARK: - Actions
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        signUpViewOutput.didPressSignUp(email: emailTextField.text, password: passwordTextField.text, firstname: firstNameTextField.text, lastname: lastNameTextField.text)
    }
    
    //MARK: - Instance Methods
    
    func setup() {
        errorLabel.isHidden = true
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    //MARK: - UIViewController
    
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
}

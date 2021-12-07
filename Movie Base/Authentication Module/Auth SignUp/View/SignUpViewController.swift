//
//  SignUpViewController.swift
//  Movie Base
//
//  Created by Anton on 24.11.2021.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController, LoginViewControllerInput {
    
    var signUpViewOutput: SignUpViewControllerOutput!

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        errorLabel.isHidden = true
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleHollowButton(signUpButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
        signUpViewOutput.didPressSignUp(email: emailTextField.text, password: passwordTextField.text, firstname: firstNameTextField.text, lastname: lastNameTextField.text)
    }
        
}

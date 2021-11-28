//
//  SignUpViewController.swift
//  Movie Base
//
//  Created by Anton on 24.11.2021.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

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
    func validateTheFiedls() -> String? {
        
        if (firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" ||
            (lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" ||
            (emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" ||
            (passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)) == "" {
            
            return "Please filled in all fields."
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !Utilities.isPasswordValid(cleanedPassword) {
            return "Please make sure your password is at least 8 characters< contains a speial character and a number."
        }
        
        return nil
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homveViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        let error = validateTheFiedls()
        
        if error != nil {
            showError(error!)
        } else {
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { result, err in
                if err != nil {
                    self.showError("Error creating user.")
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname": firstName, "lastname": lastName, "UID": result!.user.uid]) { error in
                        if error != nil {
                            self.showError("Error saving user data") //юзер был создан но пользователь не сможет зайти надо подумать
                        }
                        self.transitionToHome()
                    }
                }
            }
        }
        
    }
    
}

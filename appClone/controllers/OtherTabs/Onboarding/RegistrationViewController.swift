//
//  RegistrationViewController.swift
//  appClone
//
//  Created by Lokesh Cheenu on 24/04/24.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    struct Constants {
        static let cornerradius: CGFloat = 8.0
    }
    
    private let usernameField: UITextField = {
        //annonymous closure
        let field = UITextField()
        field.placeholder = "UserName"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerradius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let emailField: UITextField = {
        //annonymous closure
        let field = UITextField()
        field.placeholder = "Email Address"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerradius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordfield: UITextField = {
        let field = UITextField()
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerradius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor

        //to make the text not visible
        field.isSecureTextEntry = true
        
        return field
    }()
    
    private let RegistrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerradius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegistrationButton.addTarget(self,
                                     action: #selector(didtapregister),
                                     for: .touchUpInside)
        usernameField.delegate = self
        emailField.delegate = self
        passwordfield.delegate = self
        view.addSubview(RegistrationButton)
        view.addSubview(passwordfield)
        view.addSubview(emailField)
        view.addSubview(usernameField)
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top+10, width: view.width-40, height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom+10, width: view.width-40, height: 52)
        passwordfield.frame = CGRect(x: 20, y: emailField.bottom+10, width: view.width-40, height: 52)
        RegistrationButton.frame = CGRect(x: 20, y: passwordfield.bottom+10, width: view.width-40, height: 52)
        
    }
    
    @objc private func didtapregister() {
        emailField.resignFirstResponder()
        usernameField.resignFirstResponder()
        passwordfield.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordfield.text, !password.isEmpty, password.count >= 8,
              let username = usernameField.text, !username.isEmpty else {
            return
        }
        
        AuthManager.shared.registerNewUser(UserName: username, Email: email, Password: password) { registered in
            DispatchQueue.main.async {
                print(registered)
                if registered {
                    self.dismiss(animated: true)
                    print("registration success")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                            let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                }
                else {
                    print("registration failed")
                }
            }
            
        }
        
    }
}
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            emailField.becomeFirstResponder()
        }
        else if textField == emailField{
            passwordfield.becomeFirstResponder()
        }
        else{
            didtapregister()
        }
        return true
    }
}

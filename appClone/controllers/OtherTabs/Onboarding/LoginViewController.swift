//
//  LoginViewController.swift
//  appClone
//
//  Created by Lokesh Cheenu on 24/04/24.
//
import SafariServices
import UIKit

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerradius: CGFloat = 8.0
    }
    
    private let usernameemailfield: UITextField = {
        //annonymous closure
        let field = UITextField()
        field.placeholder = "UserName or Email..."
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
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerradius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundimageview = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundimageview)
        return header
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self,
                              action: #selector(didtaploginbutton),
                              for: .touchUpInside)
        createAccountButton.addTarget(self,
                              action: #selector(didtapcreatenewaccountbutton),
                              for: .touchUpInside)
        termsButton.addTarget(self,
                              action: #selector(didtaptermsbutton),
                              for: .touchUpInside)
        privacyButton.addTarget(self,
                              action: #selector(didtapprivacybutton),
                              for: .touchUpInside)
        
        usernameemailfield.delegate = self
        passwordfield.delegate = self
        
        addsubviews()
        
        view.backgroundColor = .systemBackground
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assigning frames here
        
        headerView.frame = CGRect(x: 0,
                                  y: 0.0,
                                  width: view.width,
                                  height: view.height/3.0
        )
        usernameemailfield.frame = CGRect(x: 25,
                                          y: headerView.bottom + 40,
                                          width: view.width-50,
                                          height: 52
        )
        passwordfield.frame = CGRect(x: 25,
                                     y: usernameemailfield.bottom + 10,
                                     width: view.width-50,
                                     height: 52
        )
        loginButton.frame = CGRect(x: 25,
                                     y: passwordfield.bottom + 10,
                                     width: view.width-50,
                                     height: 52
        )
        createAccountButton.frame = CGRect(x: 25,
                                     y: loginButton.bottom + 10,
                                     width: view.width-50,
                                     height: 52
        )
        termsButton.frame = CGRect(x: 10,
                                   y: view.height-view.safeAreaInsets.bottom-100,
                                   width: view.width-20,
                                   height: 50
        )
        privacyButton.frame = CGRect(x: 10,
                                   y: view.height-view.safeAreaInsets.bottom-50,
                                   width: view.width-20,
                                   height: 50
        )
        
        configureheaderview()
    }
    
    private func configureheaderview(){
        guard headerView.subviews.count == 1 else {
            return
        }
        guard let backgroundview = headerView.subviews.first else {
            return
        }
        backgroundview.frame = headerView.bounds
        // add logo
        let imageview = UIImageView(image: UIImage(named: "text"))
        let imageview2 = UIImageView(image: UIImage(named: "logo"))
        headerView.addSubview(imageview)
        headerView.addSubview(imageview2)
        imageview2.contentMode = .scaleAspectFit
        imageview.contentMode = .scaleAspectFit
        imageview2.frame = CGRect(x: headerView.width/4.0,
                                  y: view.safeAreaInsets.top,
                                  width: headerView.width/2.0,
                                  height: headerView.height - view.safeAreaInsets.top)
        imageview.frame = CGRect(x: headerView.width/4.0,
                                 y: imageview.bottom+60,
                                 width: headerView.width/2.0,
                                 height: headerView.height - view.safeAreaInsets.top)
    }
    
    func addsubviews() {
        
        view.addSubview(usernameemailfield)
        view.addSubview(passwordfield)
        view.addSubview(privacyButton)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)

    }

    @objc private func didtaploginbutton() {
        passwordfield.resignFirstResponder()
        usernameemailfield.resignFirstResponder()
        
        guard let usernameEmail = usernameemailfield.text, !usernameEmail.isEmpty,
              let password = passwordfield.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
        //login functionality
        var username : String?
        var email : String?
        
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            //email
            email = usernameEmail
        }
        else {
            username = usernameEmail
        }
        
        AuthManager.shared.LoginUser(UserName: username,Email: email,Password: password) { success in
            DispatchQueue.main.async {
                if success{
                    //user logged in
                    self.dismiss(animated: true, completion: nil)
                }
                else {
                    let alert = UIAlertController(title: "Log In error", message: "you're password or email might be wrong", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    @objc private func didtaptermsbutton() {
        
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        let VC = SFSafariViewController(url: url)
        present(VC, animated: true)
        
    }
    @objc private func didtapprivacybutton() {
        
        guard let url = URL(string: "https://help.instagram.com/155833707900388") else {
            return
        }
        let VC = SFSafariViewController(url: url)
        present(VC, animated: true)
    }
    @objc private func didtapcreatenewaccountbutton() {
        let VC = RegistrationViewController()
        VC.title = " Create Account"
        present(UINavigationController(rootViewController: VC), animated: true)
    }


}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameemailfield {
            passwordfield.becomeFirstResponder()
        }
        else if textField == passwordfield{
            didtaploginbutton()
        }
        return true
    }
}

//
//  SignUpViewController.swift
//  Project2
//
//  Created by user on 7/16/23.
//

import UIKit
import Resolver

class SignUpViewController: UIViewController {
    
    @LazyInjected private var signUpViewModel: SignUpViewModel
    
    private let emailTextField : UITextField = {
        let emailTextField = UITextField()
        emailTextField.layer.cornerRadius = 2
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 22))
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leftViewMode = .always
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20)
        ]
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: attributes)
        emailTextField.borderStyle = .roundedRect
        return emailTextField
    }()
    
    private let usernameTextField : UITextField = {
        let usernameTextField = UITextField()
        usernameTextField.layer.cornerRadius = 2
        usernameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 22))
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.leftViewMode = .always
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20)
        ]
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: attributes)
        usernameTextField.borderStyle = .roundedRect
        return usernameTextField
    }()
    
    private let passTextField : UITextField = {
        let passTextField = UITextField()
        passTextField.layer.cornerRadius = 2
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20)
        ]
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: attributes)
        passTextField.borderStyle = .roundedRect
        return passTextField
    }()
    
    private let repeatPassTextField : UITextField = {
        let repeatPassTextField = UITextField()
        repeatPassTextField.layer.cornerRadius = 2
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20)
        ]
        repeatPassTextField.translatesAutoresizingMaskIntoConstraints = false
        repeatPassTextField.attributedPlaceholder = NSAttributedString(string: "Repeat password", attributes: attributes)
        repeatPassTextField.borderStyle = .roundedRect
        return repeatPassTextField
    }()
    
    private let signUpButton : UIButton = {
        let signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.backgroundColor = .systemBlue
        signUpButton.setTitle("sign Up", for: .normal)
        signUpButton.layer.cornerRadius = 8
        return signUpButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupUi()
        self.signUpButton.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
    }
    
    private func setupUi(){
        self.addViews()
        self.setLayout()
    }
    
    private func setLayout(){
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            
            usernameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            usernameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            usernameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            passTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            passTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            repeatPassTextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 20),
            repeatPassTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            repeatPassTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signUpButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 220),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    @objc func addViews(){
        self.view.addSubview(emailTextField)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passTextField)
        self.view.addSubview(repeatPassTextField)
        self.view.addSubview(signUpButton)
    }
    
    @objc func tapSignUpButton(){
        signUpViewModel.email = emailTextField.text ?? ""
        signUpViewModel.username = usernameTextField.text ?? ""
        signUpViewModel.password = passTextField.text ?? ""
        signUpViewModel.repeatPass = repeatPassTextField.text ?? ""
        signUpViewModel.signUp()
    }
}

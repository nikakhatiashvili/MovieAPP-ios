//
//  ViewController.swift
//  Project2
//
//  Created by user on 7/16/23.
//

import UIKit
import Resolver

class ViewController: UIViewController {

    @LazyInjected private var signInViewModel: SignInViewModel
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("sign in", for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let signUpButton : UIButton = {
        let  signUpButton = UIButton()
        signUpButton.backgroundColor = .systemBlue
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.layer.cornerRadius = 10
        return signUpButton
    }()
    
    private let textField : UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 2
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 22))
        
        textField.leftViewMode = .always
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: attributes)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passTextField : UITextField = {
        let passTextField = UITextField()
        passTextField.layer.cornerRadius = 2
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20)
        ]
        passTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: attributes)
        passTextField.borderStyle = .roundedRect
        return passTextField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.windows.first?.rootViewController = navigationController
        self.setupUI()
        self.addTargets()
        
    }
    private func addTargets(){
        self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
        NotificationCenter.default.addObserver(self,
                    selector: #selector(handleSignUpSuccess),
                    name: Notification.Name("SignUpSuccessNotification"),
                    object: nil)
        NotificationCenter.default.addObserver(self,
                    selector: #selector(handleSignInSuccess),
                    name: Notification.Name("SignInSuccessNotification"),
                    object:nil)
    }
    
    private func setupUI(){
        self.view.backgroundColor = .white
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.passTextField.translatesAutoresizingMaskIntoConstraints = false
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addViews()
        self.setLayout()
    }
    
    @objc func setLayout(){
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 40),
            
            signUpButton.topAnchor.constraint(equalTo: button.bottomAnchor,constant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            signUpButton.widthAnchor.constraint(equalToConstant: 200),
            
            textField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 30),
            
            passTextField.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            passTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            passTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
        ])
    }
    
    @objc func addViews(){
        self.view.addSubview(button)
        self.view.addSubview(textField)
        self.view.addSubview(passTextField)
        self.view.addSubview(signUpButton)
    }
    
    @objc func didTapButton(){
        signInViewModel.email = textField.text ?? ""
        signInViewModel.password = passTextField.text ?? ""
        signInViewModel.signIn()
    }
    
    @objc func tapSignUpButton(){
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleSignUpSuccess() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleSignInSuccess() {
        let newScreenVC = HomeViewController()
        let navigationController = UINavigationController(rootViewController: newScreenVC)
        
        UIApplication.shared.windows.first?.rootViewController = navigationController
    
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

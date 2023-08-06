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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let signUpButton : UIButton = {
        let  signUpButton = UIButton()
        signUpButton.backgroundColor = .systemBlue
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Go Guest Mode", for: .normal)
        signUpButton.layer.cornerRadius = 10
        return signUpButton
    }()
    
    private let textField : UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 2
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 22))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftViewMode = .always
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20)
        ]
        textField.autocapitalizationType = .none
        textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: attributes)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passTextField : UITextField = {
        let passTextField = UITextField()
        passTextField.layer.cornerRadius = 2
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20)
        ]
        passTextField.autocapitalizationType = .none
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: attributes)
        passTextField.borderStyle = .roundedRect
        return passTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.windows.first?.rootViewController = navigationController
        self.checkSessionId()
        self.setupUI()
        self.addTargets()
    }
    
    private func addTargets(){
        self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
    }
    
    private func checkSessionId(){
        if let sessionId = UserDefaults.standard.string(forKey: "sessionId") {
            print("SessionId exists: \(sessionId)")
            self.handleSignInSuccess()
        }
    }
    
    private func setupUI(){
        self.view.backgroundColor = .white
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
        signInViewModel.updateFields(email:textField.text ?? "", password: passTextField.text ?? "")
        signInViewModel.signIn(){ result in
            switch result {
            case .success(_):
                self.handleSignInSuccess()
            case .failure(_): break
            }
        }
    }
    
    @objc func tapSignUpButton(){
        navigateToHome()
    }
    
    @objc func handleSignInSuccess() {
        navigateToHome()
    }
    
    private func navigateToHome(){
        let newScreenVC = HomeViewController()
        let navigationController = UINavigationController(rootViewController: newScreenVC)
        UIApplication.shared.windows.first?.rootViewController = navigationController
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

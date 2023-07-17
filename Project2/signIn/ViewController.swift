//
//  ViewController.swift
//  Project2
//
//  Created by user on 7/16/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let button:UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("sign up", for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let textField:UITextField = {
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

    private let passTextField:UITextField = {
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
        self.setupUI()
        self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }

    private func setupUI(){
        
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        self.view.addSubview(textField)
        self.view.addSubview(passTextField)
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.passTextField.translatesAutoresizingMaskIntoConstraints = false
        self.button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 40),
            
            textField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 30),
            
            passTextField.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            passTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            passTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),


        ])
    }
    
    @objc func didTapButton(){
        print("button pressed")
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


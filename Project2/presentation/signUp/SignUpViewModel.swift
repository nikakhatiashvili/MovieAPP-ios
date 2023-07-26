//
//  SignInViewModel.swift
//  Project2
//
//  Created by user on 7/17/23.
//

import UIKit
import Foundation
import Resolver


class SignUpViewModel {
    
    private let signUpUseCase:SignUpUseCase
    
    init(signUpUseCase: SignUpUseCase = Resolver.resolve()) {
        self.signUpUseCase = signUpUseCase
    }
    
     var email: String = ""
     var password: String = ""
     var repeatPass:String = ""
     var username:String = ""
    
    func signUp() {
        let emailValidationResult = isValidEmail(email)
        let passwordValidationResult = isValidPassword(password,repeatPass: repeatPass)
        
        if !emailValidationResult.isValid {
            if let errorMessage = emailValidationResult.errorMessage {
                showAlert(title: "Invalid Email", message: errorMessage)
            }
            return
        }
        
        if !passwordValidationResult.isValid {
            if let errorMessage = passwordValidationResult.errorMessage {
                showAlert(title: "Invalid Password", message: errorMessage)
            }
            return
        }
        signUpUseCase.signUp(email: email, password: password) { [self] result in
            switch result {
            case .success(_):
                NotificationCenter.default.post(name: Notification.Name("SignUpSuccessNotification"), object: nil)
                self.showAlert(title: "successfully signed up", message: "sign up was a success")
            case .error(_, let message):
                self.showAlert(title: "Sign-up error:", message: "\(String(describing: message))")
            case .exception(let error):
                print("Exception: \(error)")
            }
        }
    }
    
    private func performSignUp() {
        showAlert(title: "you signed up", message: "")
    }
    
    func isValidPassword(_ password: String, repeatPass: String) -> ValidationResult {
        
        guard !password.isEmpty else {
            return ValidationResult(isValid: false,
                                    errorMessage: "Password is required.")
        }
        
        guard password == repeatPass else {
            return ValidationResult(isValid: false,
                                    errorMessage: "Passwords don't match")
        }
        
        guard password.count >= 8 else {
            return ValidationResult(isValid: false,
                                    errorMessage: "Password must be at least 8 characters long")
        }
        
        guard doStringContainsNumber(_string: password) else {
            return ValidationResult(isValid: false,
                                    errorMessage: "Password must contain at least one number")
        }
        
        return ValidationResult(isValid: true, errorMessage: nil)
    }
    
    func doStringContainsNumber( _string : String) -> Bool{
        
        let numberRegEx  = ".*[0-9]+.*"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: _string)
        
        return containsNumber
    }
    
    private func isValidEmail(_ email: String) -> ValidationResult {
        guard !email.isEmpty else {
            return ValidationResult(isValid: false, errorMessage: "Email is empty.")
        }
        
        guard isValidEmailPattern(email) else {
            return ValidationResult(isValid: false, errorMessage: "Please enter a valid email address.")
        }
        
        return ValidationResult(isValid: true, errorMessage: nil)
    }
    
    func isValidEmailPattern(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        
        if let topViewController = UIApplication.shared.windows.first?.rootViewController {
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }
}

//
//  SignInViewModel.swift
//  Project2
//
//  Created by user on 7/20/23.
//
import UIKit
import Foundation
import Resolver

class SignInViewModel {

    @Injected private var signInUseCase:SignInUseCase
    
    private var email: String = ""
    private var password: String = ""
    
    func signIn(){
        if email.isEmpty {
            return
        }
        if password.isEmpty {
            return
        }
        signInUseCase.signIn(email: email, password: password) { result in
            switch result {
            case .success(_):
                NotificationCenter.default.post(
                    name: Notification.Name("SignInSuccessNotification"), object: nil)
            case .failure(let error):
                self.showAlert(title: "Sign-in error:", message: error.localizedDescription)
            }
        }

    }
    
    func updateFields(email:String, password:String){
        self.email = email
        self.password = password
    }
    
    private func isValidEmail(_ email: String) -> ValidationResult {
        guard !email.isEmpty else {
            return ValidationResult(
                isValid: false, errorMessage: "Email is empty.")
        }
        
        guard isValidEmailPattern(email) else {
            return ValidationResult(
                isValid: false,
                errorMessage: "Please enter a valid email address.")
        }
        return ValidationResult(isValid: true, errorMessage: nil)
    }
    
    func isValidEmailPattern(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func showAlert(title: String, message: String) {
        let alertController =
        UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        if let topViewController = UIApplication.shared.windows.first?.rootViewController {
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }
}

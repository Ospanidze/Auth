//
//  ViewController.swift
//  Authentication
//
//  Created by Айдар Оспанов on 13.02.2023.
//

import UIKit

final class AuthViewController: UIViewController {
    
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let yourPage = segue.destination as? YourPageViewController else {
            return
        }
        guard let loginText = loginTF.text, !loginText.isEmpty else { return }
        yourPage.nameLogin = "Welcome, \(loginText)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    

    @IBAction func loginButtonTapped() {
        guard let loginText = loginTF.text, let passwordText = passwordTF.text,
              !loginText.isEmpty, !passwordText.isEmpty else {
            showAlert(
                title: "Login or password is empty",
                message: "Please enter your login or password")
            return
        }
        
        guard passwordText == "123", loginText == "Jinx" else {
            showAlert(
                title: "Invalid login or password",
                message: "Please enter correct login and password"
            )
            return
        }
        
    }
    
    @IBAction func userButtonTapped() {
        showAlert(title: nil, message: "your login is Jinx 🙂")
    }
    
    @IBAction func passwordButtonTapped() {
        showAlert(title: nil, message: "your password is 123 🙂")
    }
}

extension AuthViewController {
    
    func showAlert(title: String?, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}

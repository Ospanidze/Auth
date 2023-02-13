//
//  ViewController.swift
//  Authentication
//
//  Created by Айдар Оспанов on 13.02.2023.
//

import UIKit

final class AuthViewController: UIViewController {
    
    @IBOutlet var mainStackView: UIStackView!
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notifaction:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(notifaction: NSNotification) {
        guard let keyboardFrame = notifaction.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        guard keyboardHeight > mainStackView.frame.origin.y else  { return }
        let bottomSpace = self.view.frame.height - (mainStackView.frame.origin.y + mainStackView.frame.height)
        self.view.frame.origin.y -= keyboardHeight - bottomSpace + 20
    }
    
    @objc private func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }
    
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
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        
        loginTF.text = ""
        passwordTF.text = ""
    }
}

extension AuthViewController {
    
    func showAlert(title: String?, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}

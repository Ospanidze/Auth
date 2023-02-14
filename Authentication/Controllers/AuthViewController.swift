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
    
    
    @IBOutlet var loginButton: UIButton!
    
    let login = "Jinx"
    let password = "123"
    
    // MARK: Override Fanction
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let yourPage = segue.destination as? PageViewController else {
            return
        }
        guard let loginText = loginTF.text, !loginText.isEmpty else { return }
        yourPage.nameLogin = loginText
    }
    
   // MARK: Private Functions
    
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
    
    // MARK: IBActions
    
    @IBAction func loginButtonTapped() {
        guard loginTF.text != login || passwordTF.text != password else { return }
        showAlert(
            title: "Invalid login or password",
            message: "Please, enter correct login or password"
        ) { _ in
            self.passwordTF.text = ""
        }
        
    }
    
    @IBAction func userButtonTapped() {
        showAlert(title: nil, message: "your login is \(login) 🙂")
    }
    
    @IBAction func passwordButtonTapped() {
        showAlert(title: nil, message: "your password is \(password) 🙂")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is PageViewController else { return }
        loginTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: Extension

extension AuthViewController {
    
    private func showAlert(title: String?, message: String, closure: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default, handler: closure)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

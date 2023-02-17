//
//  ViewController.swift
//  Authentication
//
//  Created by Айдар Оспанов on 13.02.2023.
//

import UIKit

final class AuthViewController: UIViewController {
    
// MARK: IBOutlets
    
    @IBOutlet var mainStackView: UIStackView!
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginButton: UIButton!

// MARK: Pravte Properties
    
    private let user = User.getUser()
    
// MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTF.text = user.auth.login
        passwordTF.text = user.auth.password
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
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { vc in
            if let welcomeVC = vc as? WelcomeViewController {
                welcomeVC.nameLogin = user.person
            } else if let navigationVC = vc as? UINavigationController {
                guard let personVC = navigationVC.topViewController as? PersonViewController else { return }
                personVC.person = user.person
            }
        }
    }
    
// MARK: IBActions
    
    @IBAction func loginButtonTapped() {
        guard loginTF.text == user.auth.login, passwordTF.text == user.auth.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password",
                textField: passwordTF
            )
            return
        }
        
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotRegister(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: nil, message: "your login is \(user.auth.login) 🙂")
        : showAlert(title: nil, message: "your password is \(user.auth.password) 🙂")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
// MARK: Private Methods
    
    @objc private func keyboardWillShow(notifaction: NSNotification) {
        guard let keyboardFrame = notifaction.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        guard keyboardHeight > mainStackView.frame.origin.y else  { return }
        let minus = (mainStackView.frame.origin.y + mainStackView.frame.height)
        let bottomSpace = view.frame.height - minus
        view.frame.origin.y -= keyboardHeight - bottomSpace + 20
    }
    
    @objc private func keyboardWillHide() {
        view.frame.origin.y = 0
    }
}

// MARK: Extension

extension AuthViewController {
    private func showAlert(title: String?, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            textField?.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

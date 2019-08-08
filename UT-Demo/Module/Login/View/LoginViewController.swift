//
//  ViewController.swift
//  UT-Demo
//
//  Created by maithigiang on 8/1/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindValue()
        self.updateUI()
        
        self.viewModel.performInitialViewSetup()
    }
    
    private func bindValue() {
        guard let email = emailTextField else { return }
        emailTextField.bind { [weak self] (email) in
            guard let strongSelf = self else { return }
            strongSelf.viewModel.email.value = email
            strongSelf.viewModel.checkEnableLogin()
        }
        
        passwordTextField.bind { [weak self] (password) in
            guard let strongSelf = self else { return }
            strongSelf.viewModel.password.value = password
            strongSelf.viewModel.checkEnableLogin()
        }
    }
    
    private func updateUI() {
        guard let loginBtn = self.loginButton else { return }
        self.viewModel.enableLogin.bindAndFire {[weak self] (enable) in
            guard let strongSelf = self else { return }
            strongSelf.loginButton.isEnabled = enable
            strongSelf.loginButton.alpha = enable ? 1 : 0.5
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let repoVC = storyboard.instantiateViewController(withIdentifier: "RepoViewController") as? RepoViewController else { return }
        self.navigationController?.pushViewController(repoVC, animated: true)
    }
}
extension LoginViewController: LoginViewControllerProtocol {
    func clearEmailField() {
        self.emailTextField.text = ""
    }
    
    func clearPasswordField() {
        self.passwordTextField.text = ""
    }
    
    func enableLoginButton(_ status: Bool) {
        self.loginButton.isEnabled = status
        self.loginButton.alpha = status ? 1 : 0.5
    }
    
    func hideKeyboard() {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
    @IBAction func emailDidEndOnExit(_ sender: Any) {
        viewModel.emailDidEndOnExit()
    }
    
    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        viewModel.passwordDidEndOnExit()
    }
    
    @IBAction func login(_ sender: Any) {
        viewModel.login(email: emailTextField.text, password: passwordTextField.text)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if textField == self.emailTextField {
            self.viewModel.emailTextFieldUpdated(textField.text)
        }
        
        if textField == self.passwordTextField {
            self.viewModel.passwordTextFieldUpdated(textField.text)
        }
        
        return true
    }
}


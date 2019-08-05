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
    }
    
    private func bindValue() {
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


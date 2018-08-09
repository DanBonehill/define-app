//
//  LoginVC.swift
//  define-app
//
//  Created by Daniel Bonehill on 14/06/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!) { (success, error, uid) in
                if error != nil {
                    print(String(describing: error?.localizedDescription))
                } else if success {
                    let tabBarController = (self.storyboard?.instantiateViewController(withIdentifier: "TabBarController"))!
                    self.present(tabBarController, animated: true, completion: nil)
                }
            }
        } else {
            print("Please enter your email and password")
        }
    }
    
    @IBAction func registerBtnWasPressed(_ sender: Any) {
        let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        present(registerVC, animated: true, completion: nil)
    }
}

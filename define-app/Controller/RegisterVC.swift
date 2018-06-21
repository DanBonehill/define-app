//
//  RegisterVC.swift
//  define-app
//
//  Created by Daniel Bonehill on 14/06/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupBtnWasPressed(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" && passwordConfirmationTextField.text != "" {
            if passwordTextField.text == passwordConfirmationTextField.text {
                AuthService.instance.createUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!) { (success, error, uid) in
                    if error != nil {
                        print(String(describing: error?.localizedDescription))
                    } else if success {
                        guard let createProfileVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileVC") as? CreateProfileVC else { return }
                        createProfileVC.initData(uid: uid!)
                        self.present(createProfileVC, animated: true, completion: nil)
                    }
                }
            } else {
                print("Passwords do not match")
            }
        } else {
            print("Please provide values")
        }
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

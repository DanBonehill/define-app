//
//  EditProfileVC.swift
//  define-app
//
//  Created by Daniel Bonehill on 10/07/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit
import Firebase

class EditProfileVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var goalWeightTextField: UITextField!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = user.name
        ageTextField.text = String(describing: user.age)
        heightTextField.text = user.height.inchesToFt()
        weightTextField.text = user.weight.poundsToSt()
        goalWeightTextField.text = (user.weight - user.goalWeight).poundsToSt()
    }
    
    func initData(user: User) {
        self.user = user
    }
    
    @IBAction func saveBtnWasPressed(_ sender: Any) {
        let name = nameTextField.text
        let age = Int(ageTextField.text!)
        let height = heightTextField.text?.heightToInches()
        let weight = weightTextField.text?.weightToPounds()
        let goalWeight = goalWeightTextField.text?.weightToPounds()
        let updatedUser = User(name: name!, age: age!, height: height!, weight: weight!, goalWeight: goalWeight!)
        UserService.instance.editUser(forUid: (Auth.auth().currentUser?.uid)!, withUserData: updatedUser) { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print(String(describing: error))
            }
        }
    }
    
    @IBAction func cancelBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

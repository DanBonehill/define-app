//
//  CreateUserVC.swift
//  define-app
//
//  Created by Daniel Bonehill on 19/05/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit

class CreateUserVC: UIViewController {

    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var ageTxtField: UITextField!
    @IBOutlet weak var heightTxtField: UITextField!
    @IBOutlet weak var weightTxtField: UITextField!
    @IBOutlet weak var goalWeightTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func createBtnWasPressed(_ sender: Any) {
        createUser()
    }
    
    func createUser() {
        if nameTxtField.text != "" && ageTxtField.text != "" && heightTxtField.text != "" && weightTxtField.text != "" && goalWeightTxtField.text != "" {
            let name = nameTxtField.text!
            guard let age = Int(ageTxtField.text!) else { return print("Age is not number") }
            guard let height = heightTxtField.text?.heightToInches() else { return print("Height is not number") }
            guard let weight = weightTxtField.text?.weightToPounds() else { return print("Weight is not number") }
            guard let goalWeight = goalWeightTxtField.text?.weightToPounds() else { return print("Goal Weight is not number") }
            
            UserService.instance.createUser(name: name, age: age, height: height, weight: weight, goalWeight: goalWeight) { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: error?.localizedDescription))
                }
            }
        } else {
            print("No values provided")
        }
    }
}

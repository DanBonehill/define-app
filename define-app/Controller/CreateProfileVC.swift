//
//  CreateProfileVC.swift
//  define-app
//
//  Created by Daniel Bonehill on 19/05/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit

class CreateProfileVC: UIViewController {

    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var ageTxtField: UITextField!
    @IBOutlet weak var heightTxtField: UITextField!
    @IBOutlet weak var weightTxtField: UITextField!
    @IBOutlet weak var goalWeightTxtField: UITextField!
    
    var uid: String?
    var heightFtPickerData: [String] = ["1ft", "2ft", "3ft", "4ft", "5ft", "6ft", "7ft"]
    var heightInPickerData: [String] = ["1in", "2in", "3in", "4in", "5in", "6in", "7in", "8in", "9in", "10in", "11in"]
    var weightStPickerData: [String] = ["1st", "2st", "3st", "4st", "5st", "6st", "7st", "8st", "9st", "10st", "11st", "12st", "13st", "14st", "15st"]
    var weightLbsPickerData: [String] = ["1lb", "2lbs", "3lbs", "4lbs", "5lbs", "6lbs", "7lbs", "8lbs", "9lbs", "10lbs", "11lbs", "12lbs", "13lbs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func createBtnWasPressed(_ sender: Any) {
        createUser()
    }
    
    func initData(uid: String) {
        self.uid = uid
    }
    
    func createUser() {
        if nameTxtField.text != "" && ageTxtField.text != "" && heightTxtField.text != "" && weightTxtField.text != "" && goalWeightTxtField.text != "" {
            let name = nameTxtField.text!
            guard let age = Int(ageTxtField.text!) else { return print("Age is not number") }
            guard let height = heightTxtField.text?.heightToInches() else { return print("Height is not number") }
            guard let weight = weightTxtField.text?.weightToPounds() else { return print("Weight is not number") }
            guard let goalWeight = goalWeightTxtField.text?.weightToPounds() else { return print("Goal Weight is not number") }
            
            UserService.instance.createUser(uid: uid!, name: name, age: age, height: height, weight: weight, goalWeight: goalWeight) { (success, error) in
                if success {
                    let tabBarController = (self.storyboard?.instantiateViewController(withIdentifier: "TabBarController"))!
                    self.present(tabBarController, animated: true, completion: nil)
                } else {
                    print(String(describing: error?.localizedDescription))
                }
            }
        } else {
            print("No values provided")
        }
    }
}

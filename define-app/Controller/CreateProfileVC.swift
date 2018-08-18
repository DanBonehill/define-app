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
    
    var heightPicker: UIPickerView!
    var weightPicker: UIPickerView!
    var goalWeightPicker: UIPickerView!
    
    var ftRowSelected = 0
    var inchRowSelected = 0
    var stRowSelected = 0
    var lbsRowSelected = 0
    var goalStRowSelected = 0
    var goalLbsRowSelected = 0
    
    var heightFtPickerData: [String] = ["4ft", "5ft", "6ft", "7ft"]
    var heightInPickerData: [String] = ["0in", "1in", "2in", "3in", "4in", "5in", "6in", "7in", "8in", "9in", "10in", "11in"]
    var weightStPickerData: [String] = ["7st", "8st", "9st", "10st", "11st", "12st", "13st", "14st", "15st", "16st", "17st", "18st", "19st", "20st", "21st", "22st", "23st", "24st", "25st"]
    var weightLbsPickerData: [String] = ["0lb", "1lb", "2lbs", "3lbs", "4lbs", "5lbs", "6lbs", "7lbs", "8lbs", "9lbs", "10lbs", "11lbs", "12lbs", "13lbs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightTxtField.delegate = self
        weightTxtField.delegate = self
        goalWeightTxtField.delegate = self
        
        self.hideKeyboardWhenTappedAround()
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

extension CreateProfileVC: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == heightPicker {
            if component == 0 {
                return heightFtPickerData.count
            } else {
                return heightInPickerData.count
            }
        } else {
            if component == 0 {
                return weightStPickerData.count
            } else {
                return weightLbsPickerData.count
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == heightPicker {
            if component == 0 {
                return heightFtPickerData[row]
            } else {
                return heightInPickerData[row]
            }
        } else {
            if component == 0 {
                return weightStPickerData[row]
            } else {
                return weightLbsPickerData[row]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == heightPicker {
            let ftComponent = pickerView.selectedRow(inComponent: 0)
            let inchComponent = pickerView.selectedRow(inComponent: 1)
            let ft = heightFtPickerData[ftComponent]
            let inch = heightInPickerData[inchComponent]
            
            heightTxtField.text = "\(ft) \(inch)"
            ftRowSelected = ftComponent
            inchRowSelected = inchComponent
        } else if pickerView == weightPicker {
            let stComponent = pickerView.selectedRow(inComponent: 0)
            let lbsComponent = pickerView.selectedRow(inComponent: 1)
            let st = weightStPickerData[stComponent]
            let lbs = weightLbsPickerData[lbsComponent]

            weightTxtField.text = "\(st) \(lbs)"
            stRowSelected = stComponent
            lbsRowSelected = lbsComponent
        } else {
            let stComponent = pickerView.selectedRow(inComponent: 0)
            let lbsComponent = pickerView.selectedRow(inComponent: 1)
            let st = weightStPickerData[stComponent]
            let lbs = weightLbsPickerData[lbsComponent]

            goalWeightTxtField.text = "\(st) \(lbs)"
            goalStRowSelected = stComponent
            goalLbsRowSelected = lbsComponent
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == heightTxtField {
            self.pickUp(heightTxtField)
        } else if textField == weightTxtField {
            self.pickUp(weightTxtField)
        } else {
            self.pickUp(goalWeightTxtField)
        }
    }
    
    func pickUp(_ textField : UITextField){
        var picker: UIPickerView!
        
        // UIPickerView
        picker = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 176))
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = UIColor.white
        
        if textField == heightTxtField {
            heightPicker = picker
            textField.inputView = heightPicker
            
            heightPicker.selectRow(ftRowSelected, inComponent: 0, animated: true)
            heightPicker.selectRow(inchRowSelected, inComponent: 1, animated: true)
        } else if textField == weightTxtField {
            weightPicker = picker
            textField.inputView = weightPicker
            
            weightPicker.selectRow(stRowSelected, inComponent: 0, animated: true)
            weightPicker.selectRow(lbsRowSelected, inComponent: 1, animated: true)
        } else {
            goalWeightPicker = picker
            textField.inputView = goalWeightPicker
            
            goalWeightPicker.selectRow(goalStRowSelected, inComponent: 0, animated: true)
            goalWeightPicker.selectRow(goalLbsRowSelected, inComponent: 1, animated: true)
        }
    }
}

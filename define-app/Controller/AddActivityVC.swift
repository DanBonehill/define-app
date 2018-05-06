//
//  AddActivityVC.swift
//  define-app
//
//  Created by Daniel Bonehill on 28/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit

class AddActivityVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var activityPickerData: [String] = [String]()
    
    @IBOutlet weak var activityTypePicker: UIPickerView!
    @IBOutlet weak var activityTypeField: UITextField!
    @IBOutlet weak var activityRepsField: UITextField!
    @IBOutlet weak var activitySetsField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityTypeField.delegate = self
        self.activityTypePicker.delegate = self
        self.activityTypePicker.dataSource = self
        
        activityTypeField.text = "Select Activity"
        activityTypeField.textAlignment = .center
        
        activityPickerData = ["Squats", "Plank", "Press Up", "Crunches", "Sit Ups", "Bridge", "The Bird Dog"]
        activityTypePicker.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1) // #F6F6F6
        activityTypePicker.isHidden = true
    }
    
    @IBAction func createActivityBtnPressed(_ sender: Any) {
        if activityTypeField.text != "Select Activity" && activityRepsField.text != "" && activitySetsField.text != "" {
            DataService.instance.addActivity(activityType: activityTypeField.text!, activityRepsCount: Int(activityRepsField.text!)!, activitySetsCount: Int(activitySetsField.text!)!)
            dismiss(animated: true, completion: nil)
        } else {
            print("No values provided")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activityPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activityPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.view.endEditing(true)
        activityTypePicker.isHidden = true
        activityTypeField.isHidden = false
        activityTypeField.text = activityPickerData[row]
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activityTypeField.isHidden = true
        activityTypePicker.isHidden = false
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

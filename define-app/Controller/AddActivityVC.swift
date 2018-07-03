//
//  AddActivityVC.swift
//  define-app
//
//  Created by Daniel Bonehill on 28/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit

class AddActivityVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var activityTypeField: UITextField!
    @IBOutlet weak var activityRepsField: UITextField!
    @IBOutlet weak var activitySetsField: UITextField!
    @IBOutlet weak var repsLbl: UILabel!
    
    var activityTypePicker : UIPickerView!
    var activityPickerData: [String] = ["", "Squats", "Plank", "Press Up", "Crunches", "Sit Ups", "Bridge", "The Bird Dog"]
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityTypeField.delegate = self
        
        activityTypeField.text = "Select Activity"
        activityTypeField.textAlignment = .center
        activityTypeField.allowsEditingTextAttributes = false
        
        activityTypeField.addTarget(self, action: #selector(setSeconds), for: .allEditingEvents)
    }
    
    @IBAction func createActivityBtnPressed(_ sender: Any) {
        if activityTypeField.text != "Select Activity" && activityRepsField.text != "" && activitySetsField.text != "" {
            DataService.instance.addActivity(activityType: activityTypeField.text!, activityRepsCount: Int(activityRepsField.text!)!, activitySetsCount: Int(activitySetsField.text!)!) { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else if error != nil {
                    print(error!)
                }
            }
            
        } else {
            print("No values provided")
        }
    }
    
    func pickUp(_ textField : UITextField){
        
        // UIPickerView
        self.activityTypePicker = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.activityTypePicker.delegate = self
        self.activityTypePicker.dataSource = self
        self.activityTypePicker.backgroundColor = UIColor.white
        // Sets row to the previously selected row
        self.activityTypePicker.selectRow(selectedRow, inComponent: 0, animated: true)
        textField.inputView = self.activityTypePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
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
        activityTypeField.text = activityPickerData[row]
        selectedRow = row
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUp(activityTypeField)
    }
    
    @objc func doneClick() {
        activityTypeField.resignFirstResponder()
    }
    
    @objc func cancelClick() {
        activityTypeField.text = "Select Activity"
        selectedRow = 0
        activityTypeField.resignFirstResponder()
    }
    
    @objc func setSeconds() {
        if activityTypeField.text == "Plank" {
            repsLbl.text = "Secs"
        } else {
            repsLbl.text = "Reps"
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

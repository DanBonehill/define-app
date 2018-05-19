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
        
    }
}

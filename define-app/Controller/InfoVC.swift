//
//  InfoVC.swift
//  define-app
//
//  Created by Daniel Bonehill on 28/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var greetingNameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var currentWeightLbl: UILabel!
    @IBOutlet weak var goalWeightLbl: UILabel!
    @IBOutlet weak var weightToLoseLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserData()
    }
    
    func setupUserData() {
        let user = UserService.instance.getUser()
        let height = user.height.inchesToFt()
        let weight = user.weight.poundsToSt()
        let goalWeight = user.goalWeight.poundsToSt()
        let weightToLose = (user.weight - user.goalWeight).poundsToSt()
        
        greetingNameLbl.text = "Hey, \(user.name)"
        ageLbl.text = String(describing: user.age)
        heightLbl.text = String(describing: height)
        currentWeightLbl.text = String(describing: weight)
        goalWeightLbl.text = String(describing: goalWeight)
        weightToLoseLbl.text = String(describing: weightToLose)
    }
}

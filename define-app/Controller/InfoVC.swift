//
//  InfoVC.swift
//  define-app
//
//  Created by Daniel Bonehill on 28/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit
import Firebase

class InfoVC: UIViewController {

    @IBOutlet weak var greetingNameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var currentWeightLbl: UILabel!
    @IBOutlet weak var goalWeightLbl: UILabel!
    @IBOutlet weak var weightToLoseLbl: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var user: User!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        spinner.isHidden = false
        spinner.startAnimating()
        
        UserService.instance.getUser(forUid: (Auth.auth().currentUser?.uid)!) { (error, user) in
            if error != nil {
                self.stopSpinner()
                print(String(describing: error))
            } else {
                self.user = user
                self.setupUserData()
                self.stopSpinner()
                self.stackView.isHidden = false
            }
        }
    }
    
    func setupUserData() {
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
    
    func stopSpinner() {
        spinner.stopAnimating()
        spinner.isHidden = true
    }
    
    @IBAction func editButtonWasPressed(_ sender: Any) {
        guard let editProfileVC = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as? EditProfileVC else { return }
        editProfileVC.initData(user: user)
        self.present(editProfileVC, animated: true, completion: nil)
    }
    
    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            self.present(loginVC, animated: true, completion: nil)
        } catch {
            print(String(describing: error.localizedDescription))
        }
    }
}

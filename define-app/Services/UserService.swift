//
//  UserService.swift
//  define-app
//
//  Created by Daniel Bonehill on 08/05/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation
import Firebase

let DB = Database.database().reference()

class UserService {
    static let instance = UserService()
    
    func registerUser(uid: String, userData: Dictionary<String, Any>) {
        DB.child("users").child(uid).updateChildValues(userData)
    }
    
    func createUser(uid: String, name: String, age: Int, height: Int, weight: Int, goalWeight: Int, handler: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        let user: Dictionary<String, Any> = ["name": name, "age": age, "height": height, "weight": weight, "goalWeight": goalWeight]
        DB.child("users").child(uid).updateChildValues(user) { (error, ref) in
            if error != nil {
                handler(false, error)
            } else {
                handler(true, nil)
            }
        }
    }
    
    func getUser(forUid uid: String, handler: @escaping (_ error: Error?, _ user: User) -> ()) {
        DB.child("users").child(uid).observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.value as? NSDictionary else { return }
            let name = userSnapshot["name"] as! String
            let age = userSnapshot["age"] as! Int
            let height = userSnapshot["height"] as! Int
            let weight = userSnapshot["weight"] as! Int
            let goalWeight = userSnapshot["goalWeight"] as! Int
            
            let user = User(name: name, age: age, height: height, weight: weight, goalWeight: goalWeight)
            
            handler(nil, user)
        }
    }
}

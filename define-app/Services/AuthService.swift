//
//  AuthService.swift
//  define-app
//
//  Created by Daniel Bonehill on 14/06/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func createUser(withEmail email: String, andPassword password: String, handler: @escaping (_ status: Bool, _ error: Error?, _ uid: String?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user?.user else {
                handler(false, error, nil)
                return
            }
            
            let data: Dictionary<String, Any> = ["provider": user.providerID, "email": user.email!]
            UserService.instance.registerUser(uid: user.uid, userData: data)
            handler(true, error, user.uid)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, handler: @escaping(_ status: Bool, _ error: Error?, _ uid: String?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                handler(false, error, nil)
                return
            }
            
            handler(true, nil, user?.user.uid)
        }
    }
}

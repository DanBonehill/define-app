//
//  UserService.swift
//  define-app
//
//  Created by Daniel Bonehill on 08/05/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation
import RealmSwift

class UserService {
    static let instance = UserService()
    
    func checkForUser() -> Bool {
        do {
            let realm = try Realm(configuration: RealmConfig.dataConfig)
            let results = realm.objects(User.self)
            
            if results.count == 0 {
                return false
            } else {
                return true
            }
        } catch {
            debugPrint("Error retrieving user in realm: \(error.localizedDescription)")
        }
        return true
    }
    
    func createUser(name: String, age: Int, height: Int, weight: Int, goalWeight: Int, userCreated: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        QUEUE.sync {
            let user = User(name: name, age: age, height: height, weight: weight, goalWeight: goalWeight)
            do {
                let realm = try Realm(configuration: RealmConfig.dataConfig)
                try realm.write {
                    realm.add(user)
                    try realm.commitWrite()
                    userCreated(true, nil)
                }
            } catch {
                debugPrint("Error creating user in realm: \(error.localizedDescription)")
                userCreated(false, error)
            }
        }
    }
    
    func getUser() -> User {
        do {
            let realm = try Realm(configuration: RealmConfig.dataConfig)
            let results = realm.objects(User.self)
            let user = results[0]
            
            return user
        } catch {
            debugPrint("Error retrieving user in realm: \(error.localizedDescription)")
        }
        return User()
    }
}

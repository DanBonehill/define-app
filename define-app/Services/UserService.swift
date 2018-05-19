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
    
    func createUser(age: Int, height: Double, weight: Double, goalWeight: Double) {
        QUEUE.sync {
            let user = User(age: age, height: height, weight: weight, goalWeight: goalWeight)
            do {
                let realm = try Realm(configuration: RealmConfig.dataConfig)
                try realm.write {
                    realm.add(user)
                    try realm.commitWrite()
                }
            } catch {
                debugPrint("Error creating user in realm: \(error.localizedDescription)")
            }
        }
    }
}

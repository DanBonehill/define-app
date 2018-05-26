//
//  User.swift
//  define-app
//
//  Created by Daniel Bonehill on 07/05/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic public private(set) var name: String = ""
    @objc dynamic public private(set) var age: Int = 0
    @objc dynamic public private(set) var height: Int = 0
    @objc dynamic public private(set) var weight: Int = 0
    @objc dynamic public private(set) var goalWeight: Int = 0
    
    convenience init(name: String, age: Int, height: Int, weight: Int, goalWeight: Int) {
        self.init()
        
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
        self.goalWeight = goalWeight
    }
}

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
    @objc dynamic public private(set) var age: Int = 0
    @objc dynamic public private(set) var height: Double = 0.0
    @objc dynamic public private(set) var weight: Double = 0.0
    @objc dynamic public private(set) var goalWeight: Double = 0.0
    
    convenience init(age: Int, height: Double, weight: Double, goalWeight: Double) {
        self.init()
        
        self.age = age
        self.height = height
        self.weight = weight
        self.goalWeight = goalWeight
    }
}

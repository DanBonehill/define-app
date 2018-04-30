//
//  Activity.swift
//  define-app
//
//  Created by Daniel Bonehill on 29/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation
import RealmSwift

class Activity: Object {
    @objc dynamic public private(set) var activityDate: NSDate = NSDate()
    @objc dynamic public private(set) var activityType: String!
    @objc dynamic public private(set) var activityRepsCount: Int = 0
    @objc dynamic public private(set) var activitySetsCount: Int = 0
    @objc dynamic public private(set) var activityTotalCount: Int = 0
    
    convenience init(activityType: String, activityRepsCount: Int, activitySetsCount: Int) {
        self.init()
        
        self.activityDate = NSDate()
        self.activityType = activityType
        self.activityRepsCount = activityRepsCount
        self.activitySetsCount = activitySetsCount
        self.activityTotalCount = activityRepsCount * activitySetsCount
    }
}

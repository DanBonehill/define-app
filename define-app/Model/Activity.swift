//
//  Activity.swift
//  define-app
//
//  Created by Daniel Bonehill on 29/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation

class Activity {
    public private(set) var uid: String!
    public private(set) var activityDate: NSDate = NSDate()
    public private(set) var activityType: String!
    public private(set) var activityRepsCount: Int = 0
    public private(set) var activitySetsCount: Int = 0
    public private(set) var activityTotalCount: Int = 0
    
    init(uid: String, activityType: String, activityRepsCount: Int, activitySetsCount: Int) {
        self.uid = uid
        self.activityDate = NSDate()
        self.activityType = activityType
        self.activityRepsCount = activityRepsCount
        self.activitySetsCount = activitySetsCount
        self.activityTotalCount = activityRepsCount * activitySetsCount
    }
}

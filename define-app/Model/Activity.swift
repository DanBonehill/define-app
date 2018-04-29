//
//  Activity.swift
//  define-app
//
//  Created by Daniel Bonehill on 29/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation

class Activity {
    public private(set) var activityDate: String
    public private(set) var activityType: String
    public private(set) var activityRepsCount: Int
    public private(set) var activitySetsCount: Int
    public private(set) var activityTotalCount: Int
    
    init(activityDate: String, activityType: String, activityRepsCount: Int, activitySetsCount: Int, activityTotalCount: Int) {
        self.activityDate = activityDate
        self.activityType = activityType
        self.activityRepsCount = activityRepsCount
        self.activitySetsCount = activitySetsCount
        self.activityTotalCount = activityTotalCount
    }
}

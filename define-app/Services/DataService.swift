//
//  DataService.swift
//  define-app
//
//  Created by Daniel Bonehill on 29/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation
import RealmSwift

class DataService {
    static let instance = DataService()
    
    func addActivity(activityDate: String, activityType: String, activityRepsCount: Int, activitySetsCount: Int, activityTotalCount: Int) {
        QUEUE.sync {
            let activity = Activity(activityDate: activityDate, activityType: activityType, activityRepsCount: activityRepsCount, activitySetsCount: activitySetsCount, activityTotalCount: activityTotalCount)
            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(activity)
                    try realm.commitWrite()
                }
            } catch {
                debugPrint("Error adding run to realm: \(error.localizedDescription)")
            }
        }
        
    }
    
    func getAllActivities() -> Results<Activity>? {
        do {
            let realm = try Realm()
            let activities = realm.objects(Activity.self)
            
            return activities
        } catch {
            debugPrint("Error retrieving data from realm: \(error.localizedDescription)")
            return nil
        }
    }
}
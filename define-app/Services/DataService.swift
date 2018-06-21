//
//  DataService.swift
//  define-app
//
//  Created by Daniel Bonehill on 29/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let instance = DataService()
    
    func addActivity(activityType: String, activityRepsCount: Int, activitySetsCount: Int, handler: @escaping(_ status: Bool, _ error: Error?) -> ()) {
        let activity: Dictionary<String, Any> = ["activityType": activityType, "activityRepsCount": activityRepsCount, "activitySetsCount": activitySetsCount, "userID": Auth.auth().currentUser?.uid as Any]
        DB.child("activities").childByAutoId().updateChildValues(activity) { (error, ref) in
            if error != nil {
                handler(false, error)
            } else {
                print(ref)
                handler(true, nil)
            }
        }
    }
    
    func getAllActivities(forUid uid: String, handler: @escaping(_ activities: [Activity]?) -> ()) {
        var activites = [Activity]()
        
        DB.child("activities").observeSingleEvent(of: .value) { (activitySnapshot) in
            guard let activitySnapshot = activitySnapshot.value as? [NSDictionary] else { return }
            
            for activity in activitySnapshot {
                if activity["uid"] as? String == Auth.auth().currentUser?.uid {
                    print(activity["uid"]!)
                }
            }
        }
    }
}

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
                handler(true, nil)
            }
        }
    }
    
    func getAllActivities(forUid uid: String, handler: @escaping(_ activities: [Activity]) -> ()) {
        var activites = [Activity]()
        
        DB.child("activities").observe(.value) { (activitySnapshot) in
            guard let activityData = activitySnapshot.value as? [String : AnyObject] else { return }
            
            activityData.forEach({ (activity) in
                if activity.value["userID"] as? String == Auth.auth().currentUser?.uid {
                    let uid = String(describing: activity.key)
                    let activtyType = activity.value["activityType"] as? String
                    let activityRepsCount = activity.value["activityRepsCount"] as? Int
                    let activitySetsCount = activity.value["activitySetsCount"] as? Int
                    
                    let activityObj = Activity(uid: uid, activityType: activtyType!, activityRepsCount: activityRepsCount!, activitySetsCount: activitySetsCount!)
                    activites.append(activityObj)
                }
            })
            
            handler(activites)
        }
    }
    
    func deleteActivity(forUID uid: String, handler: @escaping(_ status: Bool, _ error: Error?) -> ()) {
        DB.child("activities").child(uid).removeValue { (error, dbRef) in
            if error == nil {
                handler(true, nil)
            } else {
                handler(false, error)
            }
        }
    }
}

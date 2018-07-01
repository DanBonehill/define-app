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
            
            activityData.values.forEach({ (activty) in
                if activty["userID"] as? String == Auth.auth().currentUser?.uid {
                    let activtyType = activty["activityType"] as? String
                    let activityRepsCount = activty["activityRepsCount"] as? Int
                    let activitySetsCount = activty["activitySetsCount"] as? Int
                    
                    let activityObj = Activity(activityType: activtyType!, activityRepsCount: activityRepsCount!, activitySetsCount: activitySetsCount!)
                    activites.append(activityObj)
                }
            })
            
            handler(activites)
        }
    }
}

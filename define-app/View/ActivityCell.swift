//
//  ActivityCell.swift
//  define-app
//
//  Created by Daniel Bonehill on 29/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {
    
    @IBOutlet weak var activityDateLbl: UILabel!
    @IBOutlet weak var activityTypeLbl: UILabel!
    @IBOutlet weak var activityRepsCountLbl: UILabel!
    @IBOutlet weak var activitySetsCountLbl: UILabel!
    @IBOutlet weak var activityTotalCountLbl: UILabel!
    @IBOutlet weak var activityRepsLbl: UILabel!
    
    func updateViews(activity: Activity) {
        activityDateLbl.text = activity.activityDate.getDateString()
        activityTypeLbl.text = activity.activityType
        activityRepsCountLbl.text = "\(activity.activityRepsCount)"
        activitySetsCountLbl.text = "\(activity.activitySetsCount)"
        activityTotalCountLbl.text = "\(activity.activityTotalCount)"
        
        if activity.activityType == "Plank" {
            activityRepsLbl.text = "Secs"
        }
    }
}

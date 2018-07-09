//
//  ActivityVC.swift
//  define-app
//
//  Created by Daniel Bonehill on 28/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import UIKit
import Firebase

class ActivityVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var activities: [Activity] = []
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            DataService.instance.getAllActivities(forUid: (Auth.auth().currentUser?.uid)!) { (activityArray) in
                self.activities = activityArray
                self.tableView.reloadData()
            }
        }
//        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (activities.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as? ActivityCell {
            cell.updateViews(activity: activities[indexPath.row])
            return cell
        } else {
            return ActivityCell()
        }
    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
//            DataService.instance.deleteActivity(forUID: self.activities[indexPath.row].uid, handler: { (success, error) in
//                if success {
//                    self.activities.remove(at: indexPath.row)
//                    self.tableView.reloadData()
////                    self.tableView.deleteRows(at: [indexPath], with: .fade)
//                } else if error != nil {
//                    print(String(describing: error))
//                }
//            })
//
//        }
//
//        return [delete]
//    }
}

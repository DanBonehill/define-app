//
//  RealmConfig.swift
//  define-app
//
//  Created by Daniel Bonehill on 30/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation
import RealmSwift

class RealmConfig {
    static var dataConfig: Realm.Configuration {
        let realmPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("realmConfig")
        let config = Realm.Configuration(
            fileURL: realmPath,
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 3) {
                    // Nothing to do!
                }
        })
        return config
    }
}
